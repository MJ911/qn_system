package qn_system;



import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.nwafu.qn_system.QnApplication;
import com.nwafu.qn_system.dao.QuestionDAO;
import com.nwafu.qn_system.dao.QuestionnaireDAO;
import com.nwafu.qn_system.entity.Answer;
import com.nwafu.qn_system.entity.Options;
import com.nwafu.qn_system.entity.Question;
import com.nwafu.qn_system.entity.Questionnaire;
import com.nwafu.qn_system.service.QnService;
import com.nwafu.qn_system.service.StatisticsService;

@RunWith(SpringRunner.class)
@SpringBootTest(classes=QnApplication.class)
/*
 * @author 李文雅
 * 测试StatisticService
 */
public class StatisticsTest {
	@Autowired()
	private StatisticsService ss;
	@Autowired
	private QnService qnService;
	@Autowired
	private QuestionDAO questionDAO;
	@Autowired
	private QuestionnaireDAO qnDAO;

//	@Autowired
//	private QuestionDAO optionDAO;
	@Ignore
	public void testGetOptionRate() {
		Question question = questionDAO.getQuestionByid(3);
		System.out.println("test1");
		List<Double> optionRate = ss.getOptionRate(question);
		System.out.println("test2");
		for(int i=0;i<optionRate.size();i++) {
			System.out.println(optionRate.get(i));
		}
		assertTrue(0.4 == optionRate.get(0));
	}
	
	@Ignore
	public void testGetAsFromQuestion() {
		Question question = questionDAO.getQuestionByid(4);
		question = ss.getAsFromQuestion(question);
		System.out.println(question.getQuestion_answer().get(0).getAnswer_info());
		assertTrue("answer222".equals(question.getQuestion_answer().get(0).getAnswer_info()));
	
	}
	
	@Test
	public void testExportFie() throws IOException {
		Questionnaire qn = qnService.getQn(17);
		File file = ss.exportFile(qn);
		BufferedReader bf = new BufferedReader(new FileReader(file));
		String str = null;
		int line = 1;
		while((str=bf.readLine()) != null) {
			System.out.println("line"+line+":"+str);
			line++;
		}
		bf.close();
	}
	
	@Test
	public void testExportQn() {
		Questionnaire qn = ss.exportQn(17);
		List<Question> questions = qn.getQuestion_list();
		for(int i=0;i<questions.size();i++) {
			
			System.out.println("*****第"+i+"次循环");
			System.out.println("*****question_id:"+questions.get(i).getQuestion_id());
			Question question = questions.get(i);
			List<Options> options = question.getOptions_list();
			List<Double> optionRate = ss.getOptionRate(question);
			for(int j=0;j<options.size();j++) {
				System.out.println("******option"+j+":"+options.get(j).getOption_number()+"\t"+"rate:"+optionRate.get(j));
			}
			
			List<Answer> question_answer = question.getQuestion_answer();
			for(int j=0;j<question_answer.size();j++) {
				System.out.println("*****answer_id:"+question_answer.get(j).getAnswer_id()+"\t"+"answer_info:"+question_answer.get(j).getAnswer_info());
			}
		}
	}
}
