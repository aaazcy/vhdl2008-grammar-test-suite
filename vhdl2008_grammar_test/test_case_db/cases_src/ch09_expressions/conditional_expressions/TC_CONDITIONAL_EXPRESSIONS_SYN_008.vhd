-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: comprehensive demonstration: conditional variable assignment inside a process — v := val when en='1' else v uses a conditional expression for conditional holding
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_var is
  port (
    clk : in  bit;
    en  : in  bit;
    din : in  integer;
    dout: out integer
  );
end entity ent_ce_var;

architecture var_ce of ent_ce_var is
begin
  process(clk)
    variable v_reg : integer := 0;
  begin
    if clk'event and clk = '1' then
      v_reg := din when en = '1' else v_reg;
      dout <= v_reg;
    end if;
  end process;
end architecture var_ce;
