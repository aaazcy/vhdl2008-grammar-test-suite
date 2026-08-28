-- =============================================================
-- Case ID: TC_PROCEDURE_SPECIFICATION_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PROCEDURE_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 4.2.1
-- Production: procedure_specification ::= procedure designator [ ( formal_parameter_list ) ]
-- Case Type: Positive
-- Test Focus: procedure specification with exclusively signal-class parameters in formal_parameter_list verifying signal interface declarations with in and out modes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ps_sigonly_ent is
  port(sys_clk: in bit; sys_en: in bit; sys_out: out bit);
end entity;
architecture bh of ps_sigonly_ent is
  procedure p_strobe(
    signal clk: in bit;
    signal en:  in bit;
    signal strobe: out bit) is
  begin
    if clk'event and clk = '1' then
      if en = '1' then
        strobe <= '1';
      else
        strobe <= '0';
      end if;
    end if;
  end procedure;
begin
  p_strobe(sys_clk, sys_en, sys_out);
end architecture bh;
