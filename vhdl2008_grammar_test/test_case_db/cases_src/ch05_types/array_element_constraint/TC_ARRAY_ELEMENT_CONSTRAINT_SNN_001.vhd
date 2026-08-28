-- =============================================================
-- Case ID: TC_ARRAY_ELEMENT_CONSTRAINT_SNN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_element_constraint ::= element_constraint
-- Case Type: Negative
-- Test Focus: Missing the element_constraint entirely after the
--            subtype name in an array element subtype declaration.
--            The syntax requires element_constraint to follow the
--            subtype_indication; omitting it produces an error.
-- Expected Result: Triggers syntax error
-- Dependencies: None
-- =============================================================
entity aes_sbox_bad_subtype is
  port (
    byte_in    : in  bit_vector(7 downto 0);
    byte_out   : out bit_vector(7 downto 0)
  );
end entity aes_sbox_bad_subtype;

architecture rtl of aes_sbox_bad_subtype is
  -- ERROR: array_element_constraint requires element_constraint,
  -- but a bare range without subtype is not a valid element_constraint
  type bad_array is array (0 to 7) of range 0 to 255;
  signal s : bad_array;
begin
  byte_out <= byte_in;
end architecture rtl;
