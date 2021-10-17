-- 
-- Work by : Chaari Mahdi and Daboussi Mariem , Engineering Students
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;


ENTITY test_bench_flicker IS
END test_bench_flicker;
 
ARCHITECTURE behavior OF test_bench_flicker IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT traffic_lights
    PORT(
         clk : IN  std_logic;
         cnf : IN  std_logic;
         rst : IN  std_logic;
			switch_dip_main_timing : in std_logic_vector (7 downto 0);--
			switch_dip_turning_left : in std_logic_vector (5 downto 0);
			switch_dip_orange_light : in std_logic_vector (3 downto 0);
			switch_dip_security_time : in std_logic_vector (1 downto 0);
			switch_dip_pedestrian_time : in std_logic_vector (5 downto 0);
			switch_dip_security_code : in std_logic_vector (7 downto 0);
			bouton_okay : in std_logic;
			Bouton_appel_pieton :inout std_logic_vector (3 downto 0);
			lights_pieton : out std_logic_vector (3 downto 0);
         Up_light : OUT  std_logic_vector(2 downto 0);
         Up_left_light : OUT  std_logic_vector(2 downto 0);
         Up_right_light : OUT  std_logic;
         Down_light : OUT  std_logic_vector(2 downto 0);
         Down_left_light : OUT  std_logic_vector(2 downto 0);
         Down_right_light : OUT  std_logic;
         Left_light : OUT  std_logic_vector(2 downto 0);
         Left_left_light : OUT  std_logic_vector(2 downto 0);
         Left_right_light : OUT  std_logic;
         Right_light : OUT  std_logic_vector(2 downto 0);
         Right_left_light : OUT  std_logic_vector(2 downto 0);
         Right_right_light : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal cnf : std_logic := '0';
   signal rst : std_logic := '0';
	signal switch_dip_main_timing : std_logic_vector (7 downto 0) :="00000000";
	signal switch_dip_turning_left : std_logic_vector (5 downto 0):= "000000";
	signal switch_dip_orange_light :  std_logic_vector (3 downto 0):="0000";
	signal switch_dip_security_time : std_logic_vector (1 downto 0):="00";
	signal switch_dip_pedestrian_time : std_logic_vector (5 downto 0):="000000";
	signal switch_dip_security_code : std_logic_vector (7 downto 0):="00000000";
	signal bouton_okay: std_logic :='0';
	signal Bouton_appel_pieton: std_logic_vector(3 downto 0) :="0000";


 	--Outputs
	signal lights_pieton : std_logic_vector(3 downto 0);
   signal Up_light : std_logic_vector(2 downto 0);
   signal Up_left_light : std_logic_vector(2 downto 0);
   signal Up_right_light : std_logic;
   signal Down_light : std_logic_vector(2 downto 0);
   signal Down_left_light : std_logic_vector(2 downto 0);
   signal Down_right_light : std_logic;
   signal Left_light : std_logic_vector(2 downto 0);
   signal Left_left_light : std_logic_vector(2 downto 0);
   signal Left_right_light : std_logic;
   signal Right_light : std_logic_vector(2 downto 0);
   signal Right_left_light : std_logic_vector(2 downto 0);
   signal Right_right_light : std_logic;

   -- Clock period definitions<
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: traffic_lights PORT MAP (
          clk => clk,
          cnf => cnf,
          rst => rst,
			 switch_dip_main_timing => switch_dip_main_timing, --
			 switch_dip_turning_left => switch_dip_turning_left,
			 switch_dip_orange_light => switch_dip_orange_light,
			 switch_dip_security_time => switch_dip_security_time,
			 switch_dip_pedestrian_time => switch_dip_pedestrian_time,
			 switch_dip_security_code => switch_dip_security_code,
			 bouton_okay => bouton_okay,
			 Bouton_appel_pieton => Bouton_appel_pieton,
			 
			 
			 lights_pieton => lights_pieton,
          Up_light => Up_light,
          Up_left_light => Up_left_light,
          Up_right_light => Up_right_light,
          Down_light => Down_light,
          Down_left_light => Down_left_light,
          Down_right_light => Down_right_light,
          Left_light => Left_light,
          Left_left_light => Left_left_light,
          Left_right_light => Left_right_light,
          Right_light => Right_light,
          Right_left_light => Right_left_light,
          Right_right_light => Right_right_light
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin
	
--Simulation du fonctionnement "NIGHT" puis "DAY" sans appel piéton:
--		rst <= '1';
--		wait for 100 ns;
--		rst<= '0';

--Simulation d'un appel piéton:
		rst <= '1';
		wait for 100 ns;
		rst<= '0';
		wait for 150 ns;
		bouton_appel_pieton<="0010";--le capteur de la voie horizontale de la côté droite
		wait for 40 ns;
		bouton_appel_pieton <="0000";
		wait for 250 ns ;
		bouton_appel_pieton<="1101";--Seul le capteur de la voie horizontale de la côté gauche est OFF
		wait for 40 ns;
		bouton_appel_pieton <="0000";



------Simulation de configuration du système:
--		rst <='1';
--		wait for 20 ns;
--		rst <='0';
--		wait for 200 ns;
--		rst <='1';
--		cnf<= '1';
--		wait for 25 ns;
--      switch_dip_security_code <= "10010110" ;
--		bouton_okay <='1';
--		wait for 5 ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--      switch_dip_main_timing <= "00011001"; --25
--		bouton_okay <='1';
--		wait for 5 ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--      switch_dip_turning_left <= "001111"; --15
--		bouton_okay <= '1';
--		wait for 5 ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--      switch_dip_orange_light <= "1001"; --9
--		bouton_okay <='1';
--		wait for 5 ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--      switch_dip_security_time <= "01"; --1
--		bouton_okay <='1';
--		wait for 5ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--      switch_dip_pedestrian_time <= "001111"; --15
--		bouton_okay <='1';
--		wait for 5 ns;
--		bouton_okay <='0';
--		wait for 20 ns;
--		switch_dip_pedestrian_time <= "000000";
--		switch_dip_security_code <= "00000000";
--		switch_dip_main_timing <= "00000000";
--		switch_dip_turning_left <= "000000";
--		switch_dip_orange_light <= "0000";
--		switch_dip_security_time <= "00";
--		cnf<= '0';
--		wait for 20 ns;	
--		rst <= '0';
		
      wait for clk_period*10;


      wait;
   end process;

END;
