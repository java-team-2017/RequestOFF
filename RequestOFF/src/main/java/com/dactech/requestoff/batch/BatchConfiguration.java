package com.dactech.requestoff.batch;

import javax.sql.DataSource;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.JobParametersBuilder;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.EnableBatchProcessing;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.core.launch.support.SimpleJobLauncher;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.scheduling.annotation.Scheduled;

import com.dactech.requestoff.model.entity.SlackRequest;

@Configuration
@EnableBatchProcessing
@Import({ BatchScheduler.class })
public class BatchConfiguration {

	@Autowired
	public JobBuilderFactory jobBuilderFactory;

	@Autowired
	private SimpleJobLauncher jobLauncher;

	@Autowired
	public StepBuilderFactory stepBuilderFactory;

	@Autowired
	public DataSource dataSource;

	@Scheduled(cron = "*/5 * * * * *")
	public void perform() throws Exception {
		JobParameters param = new JobParametersBuilder().addString("JobID", String.valueOf(System.currentTimeMillis()))
				.toJobParameters();
		JobExecution execution = jobLauncher.run(importUserJob(), param);
	}

	// tag::readerwriterprocessor[]
	@Bean
	public ItemReader<SlackRequest> reader() throws Exception {
		return new IteamReaderCustom();
	}

	@Bean
	public SlackItemProcessor processor() {
		return new SlackItemProcessor();
	}
	
	@Bean
	public ItemWriter<SlackRequest> writer() {
		return new ItemWriterCustom();
	}

//	@Bean
//	public ItemWriter<SlackRequest> writer() {
//		JdbcBatchItemWriter<SlackRequest> writer = new JdbcBatchItemWriter<SlackRequest>();
//		writer.setItemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<SlackRequest>());
//		writer.setSql("INSERT INTO slack_request "
//				+ "(msg_user_id, name, msg_content, msg_time, day_off_from, "
//				+ "day_off_to, total_hours, reason, process_flag, is_valid_msg, "
//				+ "err_msg, valid_flag) "
//				+ "VALUES (:msgUserId, :name, :msgContent, :msgTime, :dayOffFrom,"
//				+ " :dayOffTo, :totalHours, :reason, :processFlag, :isValidMsg, :errMsg,"
//				+ " :validFlag)");
//		writer.setDataSource(dataSource);
//		return writer;
//	}
//	
//	@Bean
//	public ItemWriter<WriteObj> writer2() {
//		JdbcBatchItemWriter<WriteObj> writer = new JdbcBatchItemWriter<WriteObj>();
//		writer.setItemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<WriteObj>());
//		writer.setSql("INSERT INTO role "
//				+ "(role) "
//				+ "VALUES (:role.role)");
//		writer.setDataSource(dataSource);
//		return writer;
//	}
//	
//	@Bean
//	public ItemWriter<WriteObj> writer3() {
//		JdbcBatchItemWriter<WriteObj> writer = new JdbcBatchItemWriter<WriteObj>();
//		writer.setItemSqlParameterSourceProvider(new BeanPropertyItemSqlParameterSourceProvider<WriteObj>());
//		writer.setSql("INSERT INTO role "
//				+ "(role) "
//				+ "VALUES (:validFlag)");
//		writer.setDataSource(dataSource);
//		return writer;
//	}
	// end::readerwriterprocessor[]

	// tag::jobstep[]
	@Bean
	public Job importUserJob() throws Exception {
		return jobBuilderFactory.get("importUserJob").incrementer(new RunIdIncrementer())
				.flow(step1()).end().build();
	}

	@Bean
	public Step step1() throws Exception {
		return stepBuilderFactory.get("step1")
				.<SlackRequest, SlackRequest>chunk(10)
				.reader(reader())
				.processor(processor())
				.writer(writer())
				.build();
	}
	// end::jobstep[]
}
