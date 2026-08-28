-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_EDI_004
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Rule Description: types referenced in entity_declarative_item must be declared before the reference
-- Case Type: Negative
-- Error Category: undeclared_type_error
-- Test Focus: Negative example: signal s_bad:t_unknown in the entity declarative part references the undeclared type t_unknown, type references in entity_declarative_item must point to declared types, verifying the analyzer performs a forward declaration check on entity declarative part names and rejects undeclared types
-- Expected Result: Triggers semantic error: type t_unknown not declared in entity declarative part
-- Dependencies: None
-- =============================================================
entity edi_smn2_ent is
  port(clk:in bit; y:out bit);
  signal s_bad:t_unknown;
end entity edi_smn2_ent;
architecture bh of edi_smn2_ent is
begin y<=clk; end architecture bh;
