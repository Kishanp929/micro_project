
library ieee;
use ieee.std_logic_1164.all;

entity DATAPATH is
   port (    CLK ,
           RST : in std_logic;	);

end entity DATAPATH;


architecture behave_like_this of DATAPATH is

component IF_State is
    port(
        CLK, RST: in std_logic;
        PC_WREN: in std_logic;
		  inst_out : out std_logic_vector(15 downto 0);
		  X_out : out std_logic_vector(15 downto 0)
    );
	 
ENTITY ID_State IS
  PORT (
    CLK, RST: IN STD_LOGIC;
    X_reg_if_id_input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    inst_if_id_input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);

    X_reg_id_rr_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    inst_id_rr_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    alu_control_id_rr: OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	 mem_control_id_rr: out std_logic_vector(1 downto 0);
	 wb_control_id_rr: out std_logic_vector 
    ); 

ENTITY RR_Stage IS
	PORT (
		CLK, RST: IN STD_LOGIC;
      X_reg_id_rr_input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    
	   inst_id_rr_input : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
      alu_control_id_rr_input : in STD_LOGIC_VECTOR(2 DOWNTO 0);
      mem_control_id_rr_input: in std_logic_vector(1 downto 0);
      wb_control_id_rr_input: in std_logic_vector ;
	
	
	   ADD_from_WB_a3 : in std_logic(2 downto 0);
   	data_from_WB_d3 : in std_logic(15 downto 0);
	
    X_reg_rr_ex_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
    inst_rr_ex_out : OUT STD_LOGIC_VECTOR(15 DOWNTO 0);
	 
    alu_control_rr_ex_output : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	 mem_control_rr_ex_output : out std_logic_vector(1 downto 0);
	  wb_control_rr_ex_output : out std_logic_vector;
	
	
	 WB_input_from_WB_stage : in std_logic;
	 
	 
	 Data_reg_RR_EX_output_1 : out std_logic_vector(15 downto 0);
	 Data_reg_RR_EX_output_2 : out std_logic_vector(15 downto 0)
	 
	 
	);	 
	 
	 
	 
end component;

signal signal_IF_ID1 : std_logic_vector(15 downto 0) ;
signal signal_IF_ID21 : std_logic_vector(15 downto 0) ;

signal signal_X_RR_ID : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal signal_INST_RR_ID : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal signal_CONT_alu_ID_RR : std_logic_vector(15 downto 0);
signal signal_CONT_mem_ID_RR : std_logic_vector(15 downto 0);
signal signal_CONT_wb_ID_RR : std_logic_vector(15 downto 0);


signal signal_X_RR_EX : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal signal_INST_RR_EX : STD_LOGIC_VECTOR(15 DOWNTO 0);
signal signal_CONT_alu_RR_EX : std_logic_vector(15 downto 0);
signal signal_CONT_mem_RR_EX : std_logic_vector(15 downto 0);
signal signal_CONT_wb_RR_EX : std_logic_vector(15 downto 0);
signal signal_WB_RR_connect : std_logic ;
signal signal_data_reg_output1 :  std_logic_vector(15 downto 0);
signal signal_data_reg_output2 :  std_logic_vector(15 downto 0);
signal signal_ADD_RR_WB_a3 :  std_logic_vector(2 downto 0);
signal signal_Data_RR_WB_a3 :  std_logic_vector(15 downto 0);


begin 

IF_STAGE_first : IF_State  port (CLK, RST ,'1' ,signal_IF_ID1 , signal_IF_ID21 ); --we can make PC zero for hazarad but now it's always take '1'
ID_STAGE_second : ID_State port (     CLK, RST,
    signal_IF_ID21 ,signal_IF_ID1,  signal_X_RR_ID , signal_INST_RR_ID  , signal_CONT_alu_ID_RR ,  signal_CONT_mem_ID_RR , signal_CONT_wb_ID_RR );
 
 
RR_STAGE_third : RR_Stage port(  
CLK, RST,
      signal_X_RR_ID ,
    signal_INST_RR_ID,
	 
      signal_CONT_alu_ID_RR   ,signal_CONT_mem_ID_RR
    signal_CONT_wb_ID_RR  ,
	
	signal_ADD_RR_WB_a3 , 
		
   signal_Data_RR_WB_a3,
	
   signal_X_RR_EX ,
  signal_INST_RR_EX  ,
	 
   signal_CONT_alu_RR_EX  ,
	signal_CONT_mem_RR_EX  ,
	
	 signal_CONT_wb_RR_EX  ,
	signal_WB_RR_connect ,
	 signal_data_reg_output1 ,
	 signal_data_reg_output2);




end behave_like_this ;
	