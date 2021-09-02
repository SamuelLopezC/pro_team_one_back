package org.generation.Osar;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc //esto es para configurar el entorno de mock
class OsarApplicationTests {

	@Autowired
	private MockMvc mockMvc;


	@Test
	void contextLoads() {
	}

	@Test
	public void shouldReturnDefaultMessage() throws Exception {
		this.mockMvc.perform(get("/api/user/1"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("Elias Flores Vazquez")));
		this.mockMvc.perform(get("/api/user/2"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("Cabrera")));
		this.mockMvc.perform(get("/api/user/3"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("Miriam Diego")));
		this.mockMvc.perform(get("/api/user/4"))
				.andDo(print())
				.andExpect(status().isOk())
				.andExpect(content().string(containsString("Samuel")));

		this.mockMvc.perform(get("/api/user/7"))
				.andDo(print())
				.andExpect(status().is4xxClientError());


	}//shouldReturn
}//test
