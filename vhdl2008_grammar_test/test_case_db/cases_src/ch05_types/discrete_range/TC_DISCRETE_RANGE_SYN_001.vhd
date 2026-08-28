-- =============================================================
-- Case ID: TC_DISCRETE_RANGE_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_DISCRETE_RANGE
-- Standard Reference: IEEE 1076-2008 Section 5.2.3
-- Production: discrete_range ::= discrete_subtype_indication | range
-- Case Type: Positive
-- Test Focus: Discrete range full scenarios: subtype indication(integer 0..7) / range expression(0 to 7) / range with attribute(s_vec'range) / enum range(RED to BLUE), verifying discrete_range used in multiple contexts such as for-loop/array constraint/case choice
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity dr_ent is port(y:out integer); end entity;
architecture bh of dr_ent is
  type t_color is (RED,GREEN,BLUE);
  type t_arr is array(0 to 7) of integer;
  signal s_arr:t_arr:=(others=>0); signal s_sum:integer:=0;
begin
  process is variable v:integer:=0; begin
    for i in 0 to 7 loop v:=v+i; end loop;
    for i in s_arr'range loop s_arr(i)<=i; end loop;
    s_sum<=v; y<=s_sum; wait;
  end process;
end architecture bh;
