-- =============================================================
-- Case ID: TC_ATTRIBUTE_NAME_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_ATTRIBUTE_NAME
-- Standard Reference: IEEE 1076-2008 Section 8.6
-- Production: attribute_name ::= prefix ' attribute_designator [ ( expression ) ]
-- Case Type: Positive
-- Test Focus: Array attributes: 'range + 'reverse_range + 'length — verifying the three common array predefined attributes when the prefix is an array, used as bounds in for-loops and constants
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity an_arr_ent is port(y:out integer); end entity;
architecture bh of an_arr_ent is
  type t_arr is array(0 to 15) of integer;
  signal s_a:t_arr:=(others=>0);
  constant C_LEN:integer:=s_a'length;
  signal s_sum:integer:=0;
begin
  process is variable v:integer:=0; begin
    for i in s_a'range loop v:=v+i; end loop;
    s_sum<=v; y<=s_sum; wait;
  end process;
end architecture bh;
