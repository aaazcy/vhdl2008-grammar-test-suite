-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SNN_001
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::=
--   [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Negative
-- Test Focus: SNN — missing colon token between identifier_list and
--   subtype_indication. BNF requires ":" after identifier_list.
-- Expected Result: Triggers syntax error (missing colon)
-- Dependencies: None
-- =============================================================
entity const_gen_missing_colon_e is
  generic (
    -- ERROR: missing colon after identifier_list "WIDTH"
    constant WIDTH integer := 8
  );
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity const_gen_missing_colon_e;

architecture err of const_gen_missing_colon_e is
begin
  dout <= din;
end architecture err;
