import org.junit.*;

import static org.junit.Assert.*;

public class CalculatorTest {

    private static Calculator cal=new Calculator();

    @BeforeClass
    public static void setUpBeforeClass() throws Exception{
        System.out.println("@BeforeClass");
    }
    @AfterClass
    public static void tearDownAfterClass() throws Exception{
        System.out.println("@AfterClass");
    }

    @Before
    public void setUp() throws Exception {
        System.out.println("测试开始");
    }

    @After
    public void tearDown() throws Exception {

        System.out.println("测试结束");
    }

    @Test
    public void testAdd() {
        cal.add(2,2);
        assertEquals(4,cal.getResult());
        //fail("Not yet implemented");
    }

    @Test
    public void testSubtract() {
        cal.subtract(4,2);
        assertEquals(2,cal.getResult());
        //fail("Not yet implemented");
    }

    @Ignore
    public void testMultiply() {
        fail("Not yet implemented");
    }

//    @Test(timeout = 2000)
//    public void testDivide() {
//        for(;;);
//    }

    @Test(expected = ArithmeticException.class)
    public void testDivideByZero(){
        cal.divide(4,0);
    }


}
