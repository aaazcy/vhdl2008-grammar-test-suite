-- =============================================================
-- Case ID: TC_SEM_INTERFACE_CONSTANT_DECLARATION_SMN_001
-- Rule Type: Semantic (Negative)
-- Related Rule ID: BNF_INTERFACE_CONSTANT_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 6.5.6.2
-- Production: interface_constant_declaration ::=
--   [ constant ] identifier_list : [ in ] subtype_indication [ := static_expression ]
-- Case Type: Negative (Semantic)
-- Test Focus: SEMANTIC ERROR — static_expression default type
--   does not match subtype_indication. Syntax is valid
--   (constant keyword, identifier, colon, type_mark, :=, expression
--   are all present), but the expression type "bit_vector" is
--   incompatible with subtype "positive".
-- Expected Result: Triggers semantic/elaboration error (type mismatch)
-- Dependencies: None
-- =============================================================
entity const_gen_default_mismatch_e is
  generic (
    -- ERROR: default "00001010" is bit_vector, but type is positive
    constant BASE_ADDR : positive := "00001010"
  );
  port (
    offset : in  natural;
    result : out bit
  );
end entity const_gen_default_mismatch_e;

architecture rtl of const_gen_default_mismatch_e is
  signal s_addr : natural := BASE_ADDR + offset;
begin
  result <= '1' when s_addr > 1024 else '0';
end architecture rtl;
