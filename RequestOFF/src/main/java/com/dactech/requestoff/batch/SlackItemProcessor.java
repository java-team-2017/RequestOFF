package com.dactech.requestoff.batch;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.batch.item.ItemProcessor;

import com.dactech.requestoff.model.entity.SlackRequest;

public class SlackItemProcessor implements ItemProcessor<SlackRequest, SlackRequest> {

	private static final Logger log = LoggerFactory.getLogger(SlackItemProcessor.class);
	
//	@Autowired
//	RoleRepository roleRepository;
//	@Autowired
//	public DataSource dataSource;
	
	@Override
	public SlackRequest process(SlackRequest request) throws Exception {
		System.err.println("Process =========================\n" + request.getMsgContent());
//		Role role = new Role();
//		role.setValidFlag(1);
//		role.setRole("new Role");
//		roleRepository.save(role);
//		WriteObj returnObj = new WriteObj(null, request);
//		JdbcBatchItemWriter<Role> writer = new JdbcBatchItemWriter<Role>();
//		writer.setItemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<Role>());
//		writer.setSql("INSERT INTO role "
//				+ "(role) VALUES (:role)");
//		writer.setDataSource(dataSource);
//		List<Role> roles = new ArrayList<Role>(10);
//		roles.add(role);
//		writer.write(roles);
		request.setId(10);
		return request;
	}

}
