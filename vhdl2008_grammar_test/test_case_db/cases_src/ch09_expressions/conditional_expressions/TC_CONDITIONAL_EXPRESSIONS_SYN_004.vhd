-- =============================================================
-- Case ID: TC_CONDITIONAL_EXPRESSIONS_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONDITIONAL_EXPRESSIONS
-- Standard Reference: IEEE 1076-2008 Section 9.2.1
-- Production: conditional_expressions ::= expression when condition { else expression when condition } [ else expression ]
-- Case Type: Positive
-- Test Focus: conditional expression without else (variable assignment inside a process) — v := a when b has only the when condition; no else means else unaffected
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_ce_noelse is
  port (
    clk  : in  bit;
    flag : in  boolean;
    dout : out integer
  );
end entity ent_ce_noelse;

architecture no_else of ent_ce_noelse is
begin
  process(clk)
    variable v : integer := 0;
  begin
    if clk'event and clk = '1' then
      v := 99 when flag else v;
      dout <= v;
    end if;
  end process;
end architecture no_else;
