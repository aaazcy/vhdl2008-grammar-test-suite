-- =============================================================
-- Case ID: TC_IDENTIFIER_LIST_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Test Focus: SNN — invalid delimiter in identifier_list. The BNF uses
--   commas (',') to separate identifiers. Using a semicolon (';') instead
--   is invalid because ';' terminates declarations in VHDL, it does not
--   separate list elements. This triggers a syntax error at the ';'.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (semicolon instead of comma)
-- Dependencies: None
-- =============================================================

-- ERROR: "sig_a; sig_b" uses semicolon as delimiter instead of comma.
-- The identifier_list production requires: identifier { , identifier }
-- Semicolons are statement/declaration terminators, not list separators.
entity id_list_snn1 is
  port (
    clk : in bit
  );
end entity id_list_snn1;

architecture rtl of id_list_snn1 is
  -- ERROR: ';' used instead of ',' to separate identifiers.
  -- Correct: signal sig_a, sig_b : bit;
  signal sig_a; sig_b : bit;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sig_a <= not sig_a;
      sig_b <= sig_a;
    end if;
  end process;
end architecture rtl;
