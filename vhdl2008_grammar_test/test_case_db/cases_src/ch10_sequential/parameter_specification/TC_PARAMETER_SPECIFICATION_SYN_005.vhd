-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Positive
-- Test Focus: discrete_range using attribute: `for i in data'range loop` — using array attribute range as the discrete_range
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_syn5_ent is port(din:in integer; y:out integer); end entity;
architecture bh of ps_syn5_ent is
  type t_arr is array(0 to 7) of integer;
  signal s_arr : t_arr := (others => 0);
begin
  process(din) is
    variable v_sum : integer := 0;
  begin
    for i in s_arr'range loop
      s_arr(i) <= din + i;
      v_sum := v_sum + s_arr(i);
    end loop;
    y <= v_sum;
  end process;
end architecture bh;
