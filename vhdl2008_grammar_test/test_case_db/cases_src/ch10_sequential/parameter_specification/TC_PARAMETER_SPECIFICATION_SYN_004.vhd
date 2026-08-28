-- =============================================================
-- Case ID: TC_PARAMETER_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PARAMETER_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 10.10
-- Production: parameter_specification ::= identifier in discrete_range
-- Case Type: Positive
-- Test Focus: nested for loops each with a parameter_specification: outer for i + inner for j, verifying the two parameter_specifications act independently
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_syn4_ent is port(y:out integer); end entity;
architecture bh of ps_syn4_ent is
begin
  process is
    variable v : integer := 0;
  begin
    for i in 0 to 3 loop
      for j in 0 to 7 loop
        v := v + i * 8 + j;
      end loop;
    end loop;
    y <= v;
    wait;
  end process;
end architecture bh;
