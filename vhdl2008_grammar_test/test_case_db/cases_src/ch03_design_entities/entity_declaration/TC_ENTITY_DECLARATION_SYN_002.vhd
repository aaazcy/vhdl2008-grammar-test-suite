-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: Generic all types: generic_clause contains 5 generics using integer(range+default value), time(default value), bit(default value), string(default value), boolean(default value) respectively, verifying interface_constant_declaration supports various subtype_indications and default expressions in entity_header
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_gen is
  generic(
    G_WIDTH  : integer := 8;
    G_DELAY  : time    := 1 ns;
    G_ACTIVE : bit     := '1';
    G_NAME   : string  := "ent_gen";
    G_DEBUG  : boolean := false
  );
  port(
    result : out integer
  );
end entity ent_gen;
architecture bh of ent_gen is
begin
  result <= G_WIDTH;
end architecture bh;
