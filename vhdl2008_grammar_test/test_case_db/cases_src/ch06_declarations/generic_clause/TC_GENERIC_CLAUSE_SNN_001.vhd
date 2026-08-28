-- =============================================================
-- Case ID: TC_GENERIC_CLAUSE_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: GENERIC_CLAUSE
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_clause ::= generic ( generic_list ) ;
-- Test Focus: SNN — missing opening parenthesis '(' after keyword "generic".
--   The BNF requires generic ( generic_list ) ; — the '(' is mandatory.
--   Writing "generic WIDTH : integer := 8;" without parentheses is
--   syntactically invalid.
-- Case Type: Negative
-- Expected Result: Triggers syntax error (missing '(' after generic)
-- Dependencies: None
-- =============================================================

-- ERROR: missing '(' after generic keyword. The BNF requires:
--   generic ( generic_list ) ;
-- But here the '(' is omitted, producing: generic WIDTH : integer := 8 ;
entity shifter_left is
  generic
    WIDTH : integer := 8
  ;
  port (
    din  : in  bit_vector(WIDTH-1 downto 0);
    dout : out bit_vector(WIDTH-1 downto 0)
  );
end entity shifter_left;

architecture rtl of shifter_left is
begin
  dout <= din(WIDTH-2 downto 0) & '0';
end architecture rtl;
