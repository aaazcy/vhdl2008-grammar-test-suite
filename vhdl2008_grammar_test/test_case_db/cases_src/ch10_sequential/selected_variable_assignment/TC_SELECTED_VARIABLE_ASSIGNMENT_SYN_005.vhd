-- =============================================================
-- Case ID: TC_SELECTED_VARIABLE_ASSIGNMENT_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_SELECTED_VARIABLE_ASSIGNMENT
-- Standard Reference: IEEE 1076-2008 Section 10.6.1
-- Production: selected_variable_assignment ::= with expression select [ ? ] target := selected_expressions ;
-- Case Type: Positive
-- Test Focus: Selected variable assignment in a MUX register: on the rising clock edge, with-select selects the input channel based on sel and writes v_reg, verifying the use of selected_variable_assignment in a real hardware multiplexing register
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sva_syn5_ent is port(clk:in bit; sel:in integer range 0 to 3; ch0,ch1,ch2,ch3:in integer; y:out integer); end entity;
architecture bh of sva_syn5_ent is signal s_out:integer:=0;
begin
  process(clk)
    variable v_reg:integer:=0;
  begin
    if clk'event and clk = '1' then
      with sel select v_reg :=
        ch0 when 0,
        ch1 when 1,
        ch2 when 2,
        ch3 when 3;
      s_out <= v_reg;
    end if;
    y <= s_out;
  end process;
end architecture bh;
