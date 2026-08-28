-- =============================================================
-- Case ID: TC_ELEMENT_DECLARATION_SNN_004
-- Rule Type: Syntax
-- BNF Production: ELEMENT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.3
-- Production: element_declaration ::=
--   identifier_list : element_subtype_definition ;
-- Test Focus: Missing semicolon terminator after element
--   declaration — BNF requires element_declaration to
--   be terminated by ';' before the next element or
--   'end record'; here the semicolon is missing and the
--   next element identifier appears instead
-- Case Type: Negative
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity element_declaration_snn_004 is
  port (
    addr_in  : in  bit_vector(7 downto 0);
    data_out : out bit_vector(7 downto 0)
  );
end entity element_declaration_snn_004;

architecture rtl of element_declaration_snn_004 is
  -- ERROR: missing semicolon after first element declaration
  type t_broken_rec is record
    high_addr : bit_vector(3 downto 0)
    low_addr  : bit_vector(3 downto 0);
  end record;

  signal s_rec : t_broken_rec;
  signal s_addr_int : integer range 0 to 255;
begin
  s_rec.high_addr <= addr_in(7 downto 4);
  s_rec.low_addr  <= addr_in(3 downto 0);
  s_addr_int <= to_integer(unsigned(s_rec.high_addr)) * 16
              + to_integer(unsigned(s_rec.low_addr));
  data_out <= bit_vector(to_unsigned(s_addr_int, 8));
end architecture rtl;
