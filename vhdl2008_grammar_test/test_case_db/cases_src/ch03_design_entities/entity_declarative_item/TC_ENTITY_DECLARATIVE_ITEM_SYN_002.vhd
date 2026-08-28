-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= type_declaration | subtype_declaration | constant_declaration | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: type_declaration as entity_declarative_item — the entity declarative part contains the integer range type declaration t_addr range 0 to 4095, verifying type_declaration is a legal declaration item of the entity declarative part, and the type is visible and usable in the architecture after definition
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_type_ent is
  port(clk:in bit; val_out:out integer);
  type t_addr is range 0 to 4095;
end entity edi_type_ent;
architecture bh of edi_type_ent is
  signal s_ptr:t_addr:=0;
begin
  process(clk) begin
    if clk'event and clk='1' then
      if s_ptr<4095 then s_ptr<=s_ptr+1; else s_ptr<=0; end if;
    end if;
  end process;
  val_out<=integer(s_ptr);
end architecture bh;
