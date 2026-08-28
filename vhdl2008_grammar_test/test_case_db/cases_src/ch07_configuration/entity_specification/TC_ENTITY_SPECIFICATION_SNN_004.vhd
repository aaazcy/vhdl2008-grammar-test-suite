-- =============================================================
-- Case ID: TC_ENTITY_SPECIFICATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_ENTITY_SPECIFICATION
-- Standard Reference: IEEE 1076-2008 Section 7.2
-- Production: entity_specification ::= entity_name_list : entity_class
-- Case Type: Negative
-- Test Focus: Plural form of entity_class keyword "signals" instead of "signal" -- entity_class values are reserved identifiers with fixed singular forms; using the plural "signals" is not a recognized entity_class in IEEE 1076-2008
-- Expected Result: Triggers syntax error (invalid entity_class keyword)
-- Dependencies: None
-- =============================================================
entity espec_snn4_plural is
  port(
    din  : in  bit_vector(1 downto 0);
    dout : out bit_vector(1 downto 0)
  );
end entity;

architecture bh of espec_snn4_plural is
  attribute keep : boolean;
  -- ERROR: "signals" (plural) is not a valid entity_class; must be "signal"
  attribute keep of din, dout : signals is true;
  signal buf : bit_vector(1 downto 0) := "00";
begin
  buf  <= din;
  dout <= buf;
end architecture bh;
