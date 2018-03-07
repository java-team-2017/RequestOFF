package com.dactech.requestoff.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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
import com.dactech.requestoff.model.request.EmployeeRegistRequest;
import com.dactech.requestoff.model.request.EmployeeSearchRequest;
import com.dactech.requestoff.model.request.RequestSearchRequest;
import com.dactech.requestoff.model.response.EmployeeDetailsResponse;
import com.dactech.requestoff.model.response.EmployeeOffStatisticsPagingResponse;
import com.dactech.requestoff.model.response.EmployeeRegistResponse;
import com.dactech.requestoff.model.response.EmployeeSearchResponse;
import com.dactech.requestoff.model.response.GetUserResponse;
import com.dactech.requestoff.repository.DepartmentRepository;
import com.dactech.requestoff.repository.EmployeeOffStatusRepository;
import com.dactech.requestoff.repository.EmployeeRepository;
import com.dactech.requestoff.repository.RequestRepository;
import com.dactech.requestoff.repository.RoleRepository;
import com.dactech.requestoff.repository.TeamEmployeeRepository;
import com.dactech.requestoff.repository.TeamRepository;
import com.dactech.requestoff.service.EmployeeService;
import com.dactech.requestoff.util.DateUtils;
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
				if((oldPosition.getId() == Position.POSITION_EMPLOYEE && Long.parseLong(erRequest.getPositionId()) != Position.POSITION_EMPLOYEE)
					|| (oldPosition.getId() == Position.POSITION_HR && Long.parseLong(erRequest.getPositionId()) != Position.POSITION_HR)) {
					if(employee.getListTeam() != null && employee.getListTeam().size() > 0) {
						Team team = employee.getListTeam().get(0);
						if(team != null) {
							TeamEmployee teamEmployee = teamEmployeeRepository.findByTeamIdAndEmployeeId(team.getId(), EmployeeId);
							if(teamEmployee != null) {
								teamEmployeeRepository.delete(teamEmployee);
							}
						}
					}
				}
				else if(oldPosition.getId() == Position.POSITION_LEADER && Long.parseLong(erRequest.getPositionId()) != Position.POSITION_LEADER) {
					Team team = teamRepository.findByLeaderId(EmployeeId);
					if (team != null) {
						throw new Exception(employee.getName() + " is currently the leader of " + team.getName() + ". Please remove " + employee.getName() 
											+ " from " + team.getName() + " first!");
					}
				}
				else if((oldPosition.getId() == Position.POSITION_PROJECT_MANAGER 
						&& Long.parseLong(erRequest.getPositionId()) != Position.POSITION_PROJECT_MANAGER)
						|| (oldPosition.getId() == Position.POSITION_HR_MANAGER 
						&& Long.parseLong(erRequest.getPositionId()) != Position.POSITION_HR_MANAGER)) {
					Department dept = departmentRepository.findByManagerId(EmployeeId);
					if(dept != null) {
						throw new Exception(employee.getName() + " is currently the manager of " + dept.getName() + ". Please remove " + employee.getName() 
											+ " from " + dept.getName() + " first!");
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
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy HH");
		
		String requestFromTimeStr = eospRequest.getFromTime().equals("") ? "01/01/2000 08"
				: eospRequest.getFromTime();
		Date requestFromTime = formatter.parse(requestFromTimeStr + " 08");
		
		Date requestToTime;
		if (eospRequest.getToTime().equals("")) {
			Calendar cal = Calendar.getInstance();
			cal.set(Calendar.HOUR_OF_DAY, 17);
			requestToTime = cal.getTime();
		} else {
			requestToTime = formatter.parse(eospRequest.getToTime() + " 17");
		}
		
		System.out.println(requestFromTime);
		System.out.println(requestToTime);
		
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
			EmployeeOffStatisticsPagingResponse.EmployeeStatistics eStatistics = new EmployeeOffStatisticsPagingResponse.EmployeeStatistics();
			if (employee.getPosition().getId() == Position.POSITION_PROJECT_MANAGER) {
				Department dept = departmentRepository.findByManagerId(employee.getId());
				if (dept != null) {
					employee.setDepartmentName(dept.getName());
				} else {
					employee.setDepartmentName("No Department");
				}
			} else if (employee.getPosition().getId() == Position.POSITION_LEADER) {
				Team team = teamRepository.findByLeaderId(employee.getId());
				if (team != null) {
					employee.setTeamName(team.getName());
				} else {
					employee.setTeamName("No Team");
				}
			}
			
			EmployeeOffStatus eos = EOSRepository.findById(Calendar.getInstance().get(Calendar.YEAR), employee.getId());
			employee.setEmployeeOffStatus(eos);
			
			eStatistics.setEmployee(employee);

			// classify request according to payment_flag
			// calculate total off time of each class
			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			RequestSearchRequest requestSearchRequest = new RequestSearchRequest();
			requestSearchRequest.setEmployeeId(Long.toString(employee.getId()));
			requestSearchRequest.setFromTime(formatter.format(requestFromTime));
			requestSearchRequest.setToTime(formatter.format(requestToTime));
			requestSearchRequest.setStatus(Long.toString(Request.REQUEST_STATUS_APPROVED));
			requestSearchRequest.setValidFlag("1");
			List<Request> listRequest = requestRepository.searchRequest(requestSearchRequest);
			
			List<Request> listRequestWithPaying = new ArrayList<Request>(listRequest.size());
			List<Request> listRequestWithoutPaying = new ArrayList<Request>(listRequest.size());
			long timeOffWithPaying = 0;
			long timeOffWithoutPaying = 0;

			formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSS");
			for (Request request : listRequest) {
				// get the offTime within StatisticsRequestTime
				// (the range of Request off time may be over the range of
				// StatisticsRequestTime)
				Date fromTime = formatter.parse(request.getFromTime());
				Date toTime = formatter.parse(request.getToTime());
				Date startTime = fromTime.after(requestFromTime) ? fromTime : requestFromTime;
				Date endTime = toTime.before(requestToTime) ? toTime : requestToTime;

				// calculate amount of off time in working time
				long timeOff = DateUtils.diffHours(startTime, endTime);

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
//		return null;
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
			if (user.getPosition().getId() == Position.POSITION_LEADER) {
				Team t = teamRepository.findByLeaderId(user.getId());
				if(t != null) {
					Department dept = t.getDepartment();
					if(dept != null) {
						Employee manager = dept.getManager();
						forwards.add(new GetUserResponse.IdName(manager.getId(), manager.getName()));
					}
				}
			} else if (user.getPosition().getId() == Position.POSITION_PROJECT_MANAGER) {
				Department d = departmentRepository.findByManagerId(user.getId());
				if(d != null) {
					List<Team> teams = teamRepository.findByDepartmentId(d.getId());
					if(teams != null && teams.size() > 0) {
						for(Team team : teams) {
							Employee leader = team.getLeader();
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
			if(e.getPosition().getId() == Position.POSITION_LEADER) {
				Team team = teamRepository.findByLeaderId(employeeId);
				if(team != null) {
					Department dept = team.getDepartment();
					if(dept != null) {
						Employee manager = dept.getManager();
						listRecipients.add(new GetUserResponse.IdName(manager.getId(), manager.getName()));
					}
				}
			}
			else if(e.getPosition().getId() == Position.POSITION_EMPLOYEE) {
				if(e.getListTeam() != null && e.getListTeam().size() > 0) {
					Employee leader = e.getListTeam().get(0).getLeader();
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
		double remainHours = employeeOffStatusRepository.findById(currentYear, employeeId).getRemainHours();
		return remainHours;
	}
	
	@Override
	public String getTeamName(long employeeId) {
		String teamName;
		Employee e = employeeRepository.findById(employeeId);
		if(e.getPosition().getId() == Position.POSITION_LEADER) {
			Team team = teamRepository.findByLeaderId(employeeId);
			if(team != null) {
				teamName = team.getName();
			}
			else {
				teamName = "";
			}
		}
		else if(e.getPosition().getId() == Position.POSITION_EMPLOYEE || e.getPosition().getId() == Position.POSITION_HR) {
			if(e.getListTeam().size() > 0) {
				teamName = e.getListTeam().get(0).getName();
			}
			else {
				teamName = "";
			}
		}
		else {
			teamName = "";
		}
		return teamName;
	}
	
	@Override
	public String getDepartmentName(long employeeId) {
		String departmentName;
		Employee e = employeeRepository.findById(employeeId);
		if(e.getPosition().getId() == Position.POSITION_LEADER) {
			Team team = teamRepository.findByLeaderId(employeeId);
			if(team != null) {
				Department department = team.getDepartment();
				if(department != null) {
					departmentName = department.getName();
				}
				else {
					departmentName = "";
				}
			}
			else {
				departmentName = "";
			}
		}
		else if(e.getPosition().getId() == Position.POSITION_EMPLOYEE || e.getPosition().getId() == Position.POSITION_HR) {
			if(e.getListTeam().size() > 0) {
				Department department = e.getListTeam().get(0).getDepartment();
				if(department != null) {
					departmentName = department.getName();
				}
				else {
					departmentName = "";
				}
			}
			else {
				departmentName = "";
			}
		}
		else {
			Department department = departmentRepository.findByManagerId(employeeId);
			if(department != null) {
				departmentName = department.getName();
			}
			else {
				departmentName = "";
			}
		}
		return departmentName;
	}
	
	@Override
	public boolean delete(long employeeId) throws Exception {
		Employee employee = employeeRepository.findById(employeeId);
		if (employee == null) {
			throw new Exception("can not find employee with id " + employeeId);
		}
		
		if (employee.getPosition().getId() == Position.POSITION_EMPLOYEE || employee.getPosition().getId() == Position.POSITION_HR) {
			if (employee.getListTeam() != null && employee.getListTeam().size() > 0 && employee.getListTeam().get(0)!= null) {
				throw new Exception(employee.getName() + " is currently a member of team : " + employee.getListTeam().get(0).getName()
									+ ". Please remove " + employee.getName() + " from " + employee.getListTeam().get(0).getName() + " first!");
			}
		} else if (employee.getPosition().getId() == Position.POSITION_PROJECT_MANAGER) {
			Department dept = departmentRepository.findByManagerId(employeeId);
			if (dept != null) {
				throw new Exception(employee.getName() + " is currently the manager of department : " + dept.getName() + ". Please remove "
									+ employee.getName() + " from " + dept.getName() + " first!");
			}
		} else if (employee.getPosition().getId() == Position.POSITION_LEADER) {
			Team team = teamRepository.findByLeaderId(employeeId);
			if (team != null) {
				throw new Exception(employee.getName() + " is currently the leader of team : " + team.getName() + ". Please remove "
									+ employee.getName() + " from " + team.getName() + " first!");
			}
		} else {
			throw new Exception("Unsolved ");
		}

		employeeRepository.delete(employee);
		return true;
	}
}
