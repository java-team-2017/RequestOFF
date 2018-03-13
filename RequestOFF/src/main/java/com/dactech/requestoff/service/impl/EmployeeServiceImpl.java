package com.dactech.requestoff.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.dactech.requestoff.model.entity.DayOffType;
import com.dactech.requestoff.model.entity.Department;
import com.dactech.requestoff.model.entity.Employee;
import com.dactech.requestoff.model.entity.EmployeeOffStatus;
import com.dactech.requestoff.model.entity.Position;
import com.dactech.requestoff.model.entity.Request;
import com.dactech.requestoff.model.entity.Role;
import com.dactech.requestoff.model.entity.Team;
import com.dactech.requestoff.model.entity.TeamEmployee;
import com.dactech.requestoff.model.request.EmployeeDetailsRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatisticsPagingRequest;
import com.dactech.requestoff.model.request.EmployeeOffStatusSearchRequest;
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsPagingResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.model.response.GetUserResponse;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.PositionRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.repository.RoleRepository;
import com.dactech.requestoff.repository.TeamEmployeeRepository;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.util.StringUtil;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeRepository employeeRepository;
	@Autowired
	EmployeeOffStatusRepository employeeOffStatusRepository;
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	@Autowired
	private RequestRepository requestRepository;
	@Autowired
	private DepartmentRepository departmentRepository;
	@Autowired
	private TeamRepository teamRepository;
	@Autowired
	private EmployeeOffStatusRepository EOSRepository;
	@Autowired
	private RoleRepository roleRepository;
	@Autowired
	private TeamEmployeeRepository teamEmployeeRepository;
	@Autowired
	private PositionRepository positionRepository;

	@Override
	public EmployeeRegistResponse employeeRegist(EmployeeRegistRequest erRequest) throws Exception {
		Employee employee;
		if (StringUtil.isEmpty(erRequest.getId())) { // create new Employee
			employee = new Employee();
			employee.setName(erRequest.getName());
			employee.setGender(erRequest.getGender());
			employee.setBirthday(erRequest.getBirthday());

			Position position = new Position();
			position.setId(Long.parseLong(erRequest.getPositionId()));
			employee.setPosition(position);

			employee.setEmail(erRequest.getEmail());
			employee.setPassword(bCryptPasswordEncoder.encode(erRequest.getPassword()));
			employee.setPhone(erRequest.getPhone());
			employee.setStartWorkingDate(erRequest.getStartWorkingDate());
			employee.setOfficialWorkingDate(erRequest.getOfficialWorkingDate());
			employee.setValidFlag(Integer.parseInt(erRequest.getValidFlag()));
			
//			Team team = teamRepository.findById(Long.parseLong(erRequest.getTeamId()));
//			List<Team> listTeam = new ArrayList<Team>();
//			listTeam.add(team);
//			employee.setListTeam(listTeam);
			
			List<Role> listRole = new ArrayList<Role>();
			for(String roleId : erRequest.getRoleIds()) {
				Role role = roleRepository.findById(Long.parseLong(roleId));
				listRole.add(role);
			}
			employee.setListRole(listRole);
		} else { // update employee
			Long EmployeeId = Long.parseLong(erRequest.getId());
			employee = employeeRepository.findById(EmployeeId);
			if (employee == null) {
				throw new Exception("cannot find the Employee with id : " + EmployeeId);
			}
			if (!employee.getUpdateDate().equals(erRequest.getUpdateDate())) {
				throw new Exception(
						"Someone updated Employee with id " + erRequest.getId() + " at " + employee.getUpdateDate());
			}

			if (StringUtil.isNotEmpty(erRequest.getName())) {
				employee.setName(erRequest.getName());
			}
			if (StringUtil.isNotEmpty(erRequest.getGender())) {
				employee.setGender(erRequest.getGender());
			}
			if (StringUtil.isNotEmpty(erRequest.getBirthday())) {
				employee.setBirthday(erRequest.getBirthday());
			}
			if (StringUtil.isNotEmpty(erRequest.getPositionId())) {
				Position oldPosition = employee.getPosition();
				Position newPosition = positionRepository.findById(Long.parseLong(erRequest.getPositionId()));
				if((oldPosition.getCode() == Position.CODE_EMPLOYEE && newPosition.getCode() != Position.CODE_EMPLOYEE)) {
					if(isLeader(employee.getId())) {
						Team team = teamRepository.findByLeaderId(EmployeeId);
						if (team != null) {
							throw new Exception(employee.getName() + " is currently the leader of " + team.getName() + ". Please remove " + employee.getName() 
												+ " from " + team.getName() + " before changing position");
						} else if(requestRepository.getNumberOfRequestInProcessing(employee.getId()) > 0) {
							throw new Exception(employee.getName() + " has requests in processing. Please let these requests processed before changing position");
						}
					} else {
						if(requestRepository.getNumberOfRequestInProcessing(employee.getId()) == 0) {
							if(employee.getListTeam() != null && employee.getListTeam().size() > 0) {
								Team team = employee.getListTeam().get(0);
								if(team != null) {
									TeamEmployee teamEmployee = teamEmployeeRepository.findByTeamIdAndEmployeeId(team.getId(), EmployeeId);
									if(teamEmployee != null) {
										teamEmployeeRepository.delete(teamEmployee);
									}
								}
							}
						} else {
							throw new Exception(employee.getName() + " has requests in processing. Please let these requests processed before changing position");
						}
					}
				} else if((oldPosition.getCode() == Position.CODE_MANAGER 
						&& newPosition.getCode() != Position.CODE_MANAGER)) {
					Department dept = departmentRepository.findByManagerId(EmployeeId);
					if(dept != null) {
						throw new Exception(employee.getName() + " is currently the manager of " + dept.getName() + ". Please remove " + employee.getName() 
											+ " from " + dept.getName() + " before changing position");
					} else if(requestRepository.getNumberOfRequestInProcessing(employee.getId()) > 0) {
						throw new Exception(employee.getName() + " has requests in processing. Please let these requests processed before changing position");
					}
				}
				
				Position position = new Position();
				position.setId(Long.parseLong(erRequest.getPositionId()));
				employee.setPosition(position);
			}
			if (StringUtil.isNotEmpty(erRequest.getEmail())) {
				employee.setEmail(erRequest.getEmail());
			}
			if (StringUtil.isNotEmpty(erRequest.getPassword())) {
				employee.setPassword(bCryptPasswordEncoder.encode(erRequest.getPassword()));
			}
			if (StringUtil.isNotEmpty(erRequest.getPhone())) {
				employee.setPhone(erRequest.getPhone());
			}
			if (StringUtil.isNotEmpty(erRequest.getStartWorkingDate())) {
				employee.setStartWorkingDate(erRequest.getStartWorkingDate());
			}
			if (StringUtil.isNotEmpty(erRequest.getOfficialWorkingDate())) {
				employee.setOfficialWorkingDate(erRequest.getOfficialWorkingDate());
			}
//			if (StringUtil.isNotEmpty(erRequest.getTeamId())) {
//				Team team = teamRepository.findById(Long.parseLong(erRequest.getTeamId()));
//				List<Team> listTeam = new ArrayList<Team>();
//				listTeam.add(team);
//				employee.setListTeam(listTeam);
//			}
			if (erRequest.getRoleIds().size() > 0) {
				List<Role> listRole = new ArrayList<Role>();
				for(String roleId : erRequest.getRoleIds()) {
					Role role = roleRepository.findById(Long.parseLong(roleId));
					listRole.add(role);
				}
				employee.setListRole(listRole);
			}
			if (StringUtil.isNotEmpty(erRequest.getValidFlag())) {
				employee.setValidFlag(Integer.parseInt(erRequest.getValidFlag()));
			}
		}
		employeeRepository.save(employee);
		
		EmployeeOffStatus eos;
		long currentYear = Calendar.getInstance().get(Calendar.YEAR);
		if (StringUtil.isEmpty(erRequest.getId())) {
			eos = new EmployeeOffStatus();
			eos.setEmployeeId(employee.getId());
			eos.setYearId(currentYear);
			eos.setRemainHours(Double.parseDouble(erRequest.getRemainHours()));
			eos.setTotalHours(Double.parseDouble(erRequest.getTotalOffHours()));
			eos.setValidFlag(1);
		}
		else {
			eos = employeeOffStatusRepository.findById(currentYear, employee.getId());
			eos.setRemainHours(Double.parseDouble(erRequest.getRemainHours()));
			eos.setTotalHours(Double.parseDouble(erRequest.getTotalOffHours()));
		}
		employeeOffStatusRepository.save(eos);
		
		return new EmployeeRegistResponse(employee.getId());
	}

	@Override
	public EmployeeSearchResponse employeeSearch(EmployeeSearchRequest employeeSearchRequest) {
		List<Employee> listEmployee = employeeRepository.search(employeeSearchRequest);
		
		for(int i = 0; i < listEmployee.size(); i++) {
			Employee e = listEmployee.get(i);
			String teamName = getTeamName(e.getId());
			e.setTeamName(teamName);
			String departmentName = getDepartmentName(e.getId());
			e.setDepartmentName(departmentName);
			listEmployee.set(i, e);
			
			long currentYear = Calendar.getInstance().get(Calendar.YEAR);
			EmployeeOffStatus eos = employeeOffStatusRepository.findById(currentYear, e.getId());
			e.setEmployeeOffStatus(eos);
		}
		
		EmployeeSearchResponse response = new EmployeeSearchResponse();
		response.setEmployees(listEmployee);
		return response;
	}

	@Override
	public EmployeeDetailsResponse employeeDetails(EmployeeDetailsRequest employeeDetailsRequest) {
		Employee employee = employeeRepository.findById(Long.parseLong(employeeDetailsRequest.getId()));
		EmployeeDetailsResponse response = new EmployeeDetailsResponse(employee);
		return response;
	}

	@Override
	public EmployeeOffStatisticsPagingResponse employeeOffStatisticsPaging(
			EmployeeOffStatisticsPagingRequest eospRequest) throws Exception {
//*	
		int year;
		
		try {
			year = Integer.parseInt(eospRequest.getYear());
		} catch(Exception e) {
			year = Calendar.getInstance().get(Calendar.YEAR);
		}
		
		String fromTimeStr = year + "-01-01 00:00:00";
		String toTimeStr = year + "-12-31 23:59:59";
		
		// get list employee from database with name, team and department
		EmployeeSearchRequest ESRequest = new EmployeeSearchRequest();
		ESRequest.setName(eospRequest.getEmployee());
		ESRequest.setTeamDeptFlag("1");
		ESRequest.setTeamId(eospRequest.getTeamId());
		ESRequest.setDepartmentId(eospRequest.getDepartmentId());
		List<Employee> listEmployee = employeeRepository.search(ESRequest);

		// create list statistics correspond to each employee
		List<EmployeeOffStatisticsPagingResponse.EmployeeStatistics> lEStatistics = new ArrayList<EmployeeOffStatisticsPagingResponse.EmployeeStatistics>(
				listEmployee.size());
		for (Employee employee : listEmployee) {
			// assign department for manager
			EmployeeOffStatisticsPagingResponse.EmployeeStatistics eStatistics = new EmployeeOffStatisticsPagingResponse.EmployeeStatistics();
			if (employee.getPosition().getCode() == Position.CODE_MANAGER) {
				Department dept = departmentRepository.findByManagerId(employee.getId());
				if (dept != null) {
					employee.setDepartmentName(dept.getName());
					employee.setTeamName("");
				} else {
					employee.setDepartmentName("No Department");
					employee.setTeamName("");
				}
			}
			
			EmployeeOffStatus eos = EOSRepository.findById(year, employee.getId());
			employee.setEmployeeOffStatus(eos);
			eStatistics.setEmployee(employee);

			// get list request of user
			List<Request> listRequest = requestRepository.findByEmpoyeeIdAndTime(employee.getId(), fromTimeStr, toTimeStr);
			
			List<Request> listRequestWithPaying = new ArrayList<Request>(listRequest.size());
			List<Request> listRequestWithoutPaying = new ArrayList<Request>(listRequest.size());
			double timeOffWithPaying = 0;
			double timeOffWithoutPaying = 0;

			for (Request request : listRequest) {
				// calculate amount of off time in working time
				double timeOff = request.getTotalTime();

				if (request.getDayOffType().getPaymentFlag() == DayOffType.PAYMENT_FLAG_PAYING) {
					timeOffWithPaying += timeOff;
					listRequestWithPaying.add(request);
				} else {
					timeOffWithoutPaying += timeOff;
					listRequestWithoutPaying.add(request);
				}
			}

			eStatistics.setListRequestWithoutPaying(listRequestWithoutPaying);
			eStatistics.setListRequestWithPaying(listRequestWithPaying);
			eStatistics.setTimeOffWithoutPaying(timeOffWithoutPaying);
			eStatistics.setTimeOffWithPaying(timeOffWithPaying);

			lEStatistics.add(eStatistics);
		}

		EmployeeOffStatisticsPagingResponse response = new EmployeeOffStatisticsPagingResponse();
		response.setDraw(eospRequest.getDraw());
		response.setRecordsFiltered(lEStatistics.size());
		response.setRecordsTotal(lEStatistics.size());
		int start = eospRequest.getStart();
		int length = eospRequest.getLength();
		int end = start + length <= lEStatistics.size() ? start + length : lEStatistics.size();

		int sortedColIndex = eospRequest.getOrders().get(0).getColumn();
		int dir = eospRequest.getOrders().get(0).getDir().equals("desc") ? -1 : 1;
		String colData = eospRequest.getColumns().get(sortedColIndex).getData();
		Collections.sort(lEStatistics, new Comparator<EmployeeOffStatisticsPagingResponse.EmployeeStatistics>() {
			@Override
			public int compare(EmployeeOffStatisticsPagingResponse.EmployeeStatistics o1,
					EmployeeOffStatisticsPagingResponse.EmployeeStatistics o2) {
				int returnNumber;
				if (colData.equals("employee.name")) {
					String name1 = o1.getEmployee().getName();
					String name2 = o2.getEmployee().getName();
					returnNumber = dir * name1.compareToIgnoreCase(name2);
				} else if (colData.equals("employee.listTeam[0].department.name")) {
					String name1, name2;
					if (o1.getEmployee().getListTeam().size() > 0) {
						name1 = o1.getEmployee().getListTeam().get(0).getDepartment().getName();
					} else {
						name1 = o1.getEmployee().getDepartmentName();
					}
					if (o2.getEmployee().getListTeam().size() > 0) {
						name2 = o2.getEmployee().getListTeam().get(0).getDepartment().getName();
					} else {
						name2 = o2.getEmployee().getDepartmentName();
					}
					returnNumber = dir * name1.compareToIgnoreCase(name2);
				} else if (colData.equals("employee.listTeam[0].name")) {
					String name1, name2;
					if (o1.getEmployee().getListTeam().size() > 0) {
						name1 = o1.getEmployee().getListTeam().get(0).getName();
					} else if (StringUtil.isNotEmpty(o1.getEmployee().getTeamName())) {
						name1 = o1.getEmployee().getTeamName();
					} else {
						name1 = "";
					}
					if (o2.getEmployee().getListTeam().size() > 0) {
						name2 = o2.getEmployee().getListTeam().get(0).getName();
					} else if (StringUtil.isNotEmpty(o2.getEmployee().getTeamName())) {
						name2 = o2.getEmployee().getTeamName();
					} else {
						name2 = "";
					}
					returnNumber = dir * name1.compareToIgnoreCase(name2);
				} else if (colData.equals("employee.position.name")) {
					String name1 = o1.getEmployee().getPosition().getName();
					String name2 = o2.getEmployee().getPosition().getName();
					returnNumber = dir * name1.compareToIgnoreCase(name2);
				} else if (colData.equals("timeOffWithPaying")) {
					returnNumber = (int) (dir * (o1.getTimeOffWithPaying() - o2.getTimeOffWithPaying()));
				} else if (colData.equals("timeOffWithoutPaying")) {
					returnNumber = (int) (dir * (o1.getTimeOffWithoutPaying() - o2.getTimeOffWithoutPaying()));
				} else if (colData.equals("employee.employeeOffStatus.remainHours")) {
					double remainHours1 = o1.getEmployee().getEmployeeOffStatus().getRemainHours();
					double remainHours2 = o2.getEmployee().getEmployeeOffStatus().getRemainHours();
					returnNumber = (int) (dir * (remainHours1 - remainHours2));
				} else { // sort by id is default
					returnNumber = (int) (dir * (o1.getEmployee().getId() - o2.getEmployee().getId()));
				}
				return returnNumber;
			}
		});

		List<EmployeeOffStatisticsPagingResponse.EmployeeStatistics> truncatedList = lEStatistics.subList(start, end);
		response.setListEmployeeStatistics(truncatedList);
		return response;
//*/
	}

	@Override
	public Employee findByEmail(String email) {
		return employeeRepository.findByEmail(email);
	}

	@Override
	public List<GetUserResponse.IdName> findForwardList(long employeeId) throws Exception {
		List<GetUserResponse.IdName> forwards = new ArrayList<GetUserResponse.IdName>(10);
		Employee user = employeeRepository.findById(employeeId);
		if(user != null) {
			if (isLeader(employeeId)) {
				Team t = teamRepository.findByLeaderId(user.getId());
				if(t != null) {
					Department dept = t.getDepartment();
					if(dept != null) {
						Employee manager = dept.getManager();
						forwards.add(new GetUserResponse.IdName(manager.getId(), manager.getName()));
					}
				}
			} else if (user.getPosition().getCode() == Position.CODE_MANAGER) {
				Department d = departmentRepository.findByManagerId(user.getId());
				if(d != null) {
					List<Team> teams = teamRepository.findByDepartmentId(d.getId());
					if(teams != null && teams.size() > 0) {
						for(Team team : teams) {
							Employee leader = employeeRepository.findById(team.getLeaderId());
							forwards.add(new GetUserResponse.IdName(leader.getId(), leader.getName()));
						}
					}
				}
			}
		} else {
			throw new Exception("Can not find employee with id " + employeeId);
		}
		
		return forwards;
	}
	
	@Override
	public List<GetUserResponse.IdName> getListRecipients(long employeeId) throws Exception {
		List<GetUserResponse.IdName> listRecipients = new ArrayList<GetUserResponse.IdName>();
		Employee e = employeeRepository.findById(employeeId);
		if(e != null) {
			if(isLeader(employeeId)) {
				Team team = teamRepository.findByLeaderId(employeeId);
				if(team != null) {
					Department dept = team.getDepartment();
					if(dept != null) {
						Employee manager = dept.getManager();
						listRecipients.add(new GetUserResponse.IdName(manager.getId(), manager.getName()));
					}
				}
			}
			else if(e.getPosition().getCode() == Position.CODE_EMPLOYEE) {
				if(e.getListTeam() != null && e.getListTeam().size() > 0) {
					Employee leader = employeeRepository.findById(e.getListTeam().get(0).getLeaderId());
					if(leader != null) {
						listRecipients.add(new GetUserResponse.IdName(leader.getId(), leader.getName()));
						Department dept = e.getListTeam().get(0).getDepartment();
						if(dept != null) {
							Employee manager = dept.getManager();
							listRecipients.add(new GetUserResponse.IdName(manager.getId(), manager.getName()));
						}
					}
				}
			}
			else {
				listRecipients.add(new GetUserResponse.IdName(e.getId(), e.getName()));
			}
		}
		else {
			throw new Exception("Can not find employee with id " + employeeId);
		}
		return listRecipients;
	}
	
	@Override
	public double getRemainHours(long employeeId) {
		int currentYear = Calendar.getInstance().get(Calendar.YEAR);
		double remainHours;
		EmployeeOffStatus eos = employeeOffStatusRepository.findById(currentYear, employeeId);
		if(eos != null) {
			remainHours = eos.getRemainHours();
		}
		else {
			remainHours = 0;
		}
		return remainHours;
	}
	
	@Override
	public String getTeamName(long employeeId) {
		String teamName;
		Employee e = employeeRepository.findById(employeeId);
		if (e.getListTeam() != null && e.getListTeam().size() > 0) {
			return e.getListTeam().get(0).getName();
		} else {
			teamName = "";
		}
		return teamName;
	}
	
	@Override
	public String getDepartmentName(long employeeId) {
		String departmentName;
		Employee user = employeeRepository.findById(employeeId);
		if (user.getListTeam() != null && user.getListTeam().size() > 0) {
			departmentName = user.getListTeam().get(0).getDepartment().getName();
		} else {
			Department dept = departmentRepository.findByManagerId(employeeId);
			if(dept != null) {
				departmentName = dept.getName();
			} else {
				departmentName = "";
			}
		}
		return departmentName;
	}
	
	@Override
	public boolean delete(long employeeId) throws Exception {
		Employee employee = employeeRepository.findById(employeeId);
		
		EmployeeOffStatusSearchRequest eosRequest = new EmployeeOffStatusSearchRequest("", employeeId + "", "", "", "");
		List<EmployeeOffStatus>  listEos = employeeOffStatusRepository.search(eosRequest);
		for(EmployeeOffStatus eos : listEos) {
			employeeOffStatusRepository.delete(eos);
		}
		
		if (employee == null) {
			throw new Exception("can not find employee with id " + employeeId);
		}
		
		if (isLeader(employeeId)) {
			Team team = teamRepository.findByLeaderId(employeeId);
			if (team != null) {
				throw new Exception(employee.getName() + " is currently the leader of team : " + team.getName() + ". Please remove "
									+ employee.getName() + " from " + team.getName() + " first!");
			}
		} else if (employee.getPosition().getCode() == Position.CODE_EMPLOYEE) {
			if (employee.getListTeam() != null && employee.getListTeam().size() > 0 && employee.getListTeam().get(0)!= null) {
				throw new Exception(employee.getName() + " is currently a member of team : " + employee.getListTeam().get(0).getName()
									+ ". Please remove " + employee.getName() + " from " + employee.getListTeam().get(0).getName() + " first!");
			}
		} else if (employee.getPosition().getCode() == Position.CODE_MANAGER) {
			Department dept = departmentRepository.findByManagerId(employeeId);
			if (dept != null) {
				throw new Exception(employee.getName() + " is currently the manager of department : " + dept.getName() + ". Please remove "
									+ employee.getName() + " from " + dept.getName() + " first!");
			}
		} else {
			throw new Exception("Unsolved ");
		}

		employeeRepository.delete(employee);
		return true;
	}
	
	@Override
	public boolean isLeader(long employeeId) {
		TeamEmployee teamEmployee = teamEmployeeRepository.findByEmployeeId(employeeId);
		if(teamEmployee != null) {
			if (teamEmployee.getLeaderFlag() == 1) {
				return true;
			}
			return false;
		}
		return false;
	}
}
