-- =============================================================
-- Case ID: TC_INTERFACE_CONSTANT_DECLARATION_SNN_004
-- Rule Type: Syntax (Negative)
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::=
--   [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Negative
-- Test Focus: SNN — missing subtype_indication (type_mark) after colon.
--   BNF requires subtype_indication as a mandatory token after ":".
-- Expected Result: Triggers syntax error (missing subtype_indication)
-- Dependencies: None
-- =============================================================
entity const_gen_no_typemark_e is
  generic (
    -- ERROR: colon present but no subtype_indication follows
    constant WIDTH :
  );
  port (
    din  : in  bit_vector(7 downto 0);
    dout : out bit_vector(7 downto 0)
  );
end entity const_gen_no_typemark_e;

architecture err of const_gen_no_typemark_e is
begin
  dout <= din;
end architecture err;
