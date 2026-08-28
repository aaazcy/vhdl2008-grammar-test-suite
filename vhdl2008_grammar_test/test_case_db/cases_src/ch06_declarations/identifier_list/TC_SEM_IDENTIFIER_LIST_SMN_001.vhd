-- =============================================================
-- Case ID: TC_SEM_IDENTIFIER_LIST_SMN_001
-- Related Rule ID: SEM_IDENTIFIER_LIST_SMN_001
-- Rule Type: Semantic (Negative)
-- BNF Production: IDENTIFIER_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.4.2.2
-- Production: identifier_list ::= identifier { , identifier }
-- Test Focus: Semantic error — duplicate identifiers within the same
--   identifier_list. The signal declaration "signal s_data, s_data : bit;"
--   lists "s_data" twice. The syntax is valid (both are identifiers and
--   commas are used), but VHDL semantics forbid declaring the same
--   identifier twice in the same declarative region.
-- Case Type: Negative (Semantic)
-- Expected Result: Triggers semantic error (duplicate identifier declaration)
-- Dependencies: None
-- =============================================================

-- ERROR: s_data appears twice in the same identifier_list.
-- This is a semantic error: duplicate declaration in the same scope.
entity id_list_smn1 is
  port (
    clk : in bit
  );
end entity id_list_smn1;

architecture rtl of id_list_smn1 is
  -- ERROR: duplicate identifier "s_data" in the same identifier_list
  signal s_data, s_data : bit;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      s_data <= not s_data;
    end if;
  end process;
end architecture rtl;
