-- =============================================================
-- Case ID: TC_GENERIC_LIST_SNN_001
-- Rule Type: Syntax (Negative)
-- BNF Production: GENERIC_LIST
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: generic_list ::= generic_interface_list
-- Test Focus: SNN — invalid delimiter between generic interface declarations.
--   The generic_interface_list uses semicolons (';') to separate elements.
--   Using commas (',') instead is syntactically invalid in a generic list
--   context (commas separate identifiers within an identifier_list, not
--   interface_declarations within an interface_list).
-- Case Type: Negative
-- Expected Result: Triggers syntax error (comma instead of semicolon)
-- Dependencies: None
-- =============================================================

-- ERROR: commas used instead of semicolons to separate generic declarations.
-- The generic_interface_list syntax requires ';' between elements:
--   interface_declaration { ; interface_declaration }
-- Using ',' violates the BNF for interface_list separators.
entity alu_config is
  generic (
    OP_WIDTH : integer := 4,
    DATA_WIDTH : integer := 8
  );
  port (
    opcode  : in  bit_vector(OP_WIDTH-1 downto 0);
    op_a    : in  bit_vector(DATA_WIDTH-1 downto 0);
    op_b    : in  bit_vector(DATA_WIDTH-1 downto 0);
    result  : out bit_vector(DATA_WIDTH-1 downto 0)
  );
end entity alu_config;

architecture rtl of alu_config is
begin
  result <= op_a xor op_b;
end architecture rtl;
