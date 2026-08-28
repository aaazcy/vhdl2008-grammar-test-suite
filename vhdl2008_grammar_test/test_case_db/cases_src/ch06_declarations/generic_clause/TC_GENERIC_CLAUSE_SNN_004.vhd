-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SNN_004
-- Rule Type: Syntax (Negative)
-- BNF Production: GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Test Focus: SNN — missing terminating semicolon ';' after closing ')'.
--   The BNF requires generic ( generic_list ) ; — the ';' is mandatory
--   after the closing parenthesis. Omitting it means the parser cannot
--   distinguish the end of the generic_clause from the start of the port_clause.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing ';' after generic clause)
-- Dependencies: None
-- =============================================================

-- ERROR: missing ';' after closing ')'. The BNF requires:
--   generic ( generic_list ) ;
-- But here the ';' is omitted, producing: generic ( ... ) [no semicolon]
entity comparator_eq is
  generic (
    DATA_WIDTH : integer := 4
  )  -- ERROR: missing ';' after ')'
  port (
    a     : in  bit_vector(DATA_WIDTH-1 downto 0);
    b     : in  bit_vector(DATA_WIDTH-1 downto 0);
    equal : out bit
  );
end entity comparator_eq;

architecture rtl of comparator_eq is
begin
  process(a, b)
  begin
    if a = b then
      equal <= '1';
    else
      equal <= '0';
    end if;
  end process;
end architecture rtl;
