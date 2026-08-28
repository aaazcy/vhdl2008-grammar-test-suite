-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with an unconstrained array type as a formal parameter in formal_parameter_list exercising the interface type with index ranges deferred to call site
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_unconstr_ent is
  port(address: in natural; value: out integer);
end entity;
architecture bh of ps_unconstr_ent is
  type int_array is array(natural range <>) of integer;
  procedure p_sum(
    constant arr: in int_array;
    signal result: out integer) is
    variable total: integer := 0;
  begin
    for i in arr'range loop
      total := total + arr(i);
    end loop;
    result <= total;
  end procedure;
  signal s_data: int_array(0 to 7) := (others => 0);
  signal s_result: integer := 0;
begin
  s_data(0) <= address;
  p_sum(s_data, s_result);
  value <= s_result;
end architecture bh;
