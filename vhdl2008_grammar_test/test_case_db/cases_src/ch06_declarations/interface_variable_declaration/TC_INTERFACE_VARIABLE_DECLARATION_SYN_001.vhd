-- =============================================================
-- Case ID: TC_INTERFACE_VARIABLE_DECLARATION_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_INTERFACE_VARIABLE_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_variable_declaration ::= [ variable ] identifier_list : [ mode ] subtype_indication [ := static_expression ]
-- Case Type: Positive
-- Test Focus: Exercises interface_variable_declaration in a procedure parameter list with mode and default values.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity interface_variable_syn1 is
  port (
    clk   : in  bit;
    data  : in  integer range 0 to 255;
    result : out integer range 0 to 65535
  );
end entity interface_variable_syn1;

architecture rtl of interface_variable_syn1 is
  procedure accumulate(
    variable value   : in  integer range 0 to 255;
    variable total   : inout integer range 0 to 65535;
    variable count   : out integer range 0 to 255
  ) is
    variable v_overflow : boolean := false;
  begin
    total := total + value;
    count := count + 1;
  end procedure;

  signal s_total : integer range 0 to 65535 := 0;
begin
  process(clk)
    variable v_total : integer range 0 to 65535 := 0;
    variable v_cnt   : integer range 0 to 255 := 0;
    variable v_val   : integer range 0 to 255 := 0;
  begin
    if clk'event and clk = '1' then
      v_val := data;
      accumulate(v_val, v_total, v_cnt);
      s_total <= v_total;
    end if;
  end process;
  result <= s_total;
end architecture rtl;
