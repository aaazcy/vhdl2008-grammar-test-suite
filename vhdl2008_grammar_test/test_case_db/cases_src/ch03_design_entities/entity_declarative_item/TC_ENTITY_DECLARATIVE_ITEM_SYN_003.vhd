-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= type_declaration | subtype_declaration | constant_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: subtype_declaration as entity_declarative_item — the entity declarative part defines t_byte via subtype as t_data range 0 to 255 constrained subtype, verifying subtype_declaration can legally define a subtype based on a declared type in the entity declarative part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_subtype_ent is
  port(din:in integer; dout:out integer);
  type t_data is range 0 to 65535;
  subtype t_byte is t_data range 0 to 255;
end entity edi_subtype_ent;
architecture bh of edi_subtype_ent is
  signal s_b:t_byte:=0;
begin
  s_b<=t_byte(din mod 256);
  dout<=integer(s_b);
end architecture bh;
