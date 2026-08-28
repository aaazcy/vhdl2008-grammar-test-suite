-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with default value expressions for formal parameters in formal_parameter_list exercising the := default_expression syntax for in-mode parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_defaults_ent is
  port(trigger: in bit; result: out integer);
end entity;
architecture bh of ps_defaults_ent is
  procedure p_configure(
    constant period : in time    := 10 ns;
    constant width  : in integer := 8;
    signal   output : out integer) is
  begin
    output <= width;
  end procedure;
  signal s_cfg: integer := 0;
begin
  process(trigger)
  begin
    if trigger = '1' then
      p_configure(output => s_cfg);
      p_configure(period => 20 ns, width => 16, output => s_cfg);
    end if;
  end process;
  result <= s_cfg;
end architecture bh;
