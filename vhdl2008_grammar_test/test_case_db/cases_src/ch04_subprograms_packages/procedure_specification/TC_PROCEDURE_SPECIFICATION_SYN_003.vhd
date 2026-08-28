-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with omitted formal_parameter_list (bare designator, no parentheses) exercising the optional bracket in the BNF production for a parameterless procedure
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_noparam_ent is
  port(rst_n: in bit; ready: out bit);
end entity;
architecture bh of ps_noparam_ent is
  procedure p_assert_ready is
  begin
    assert ready='1' report "not ready" severity warning;
  end procedure;
begin
  process(rst_n)
  begin
    if rst_n = '0' then
      p_assert_ready;
    end if;
  end process;
end architecture bh;
