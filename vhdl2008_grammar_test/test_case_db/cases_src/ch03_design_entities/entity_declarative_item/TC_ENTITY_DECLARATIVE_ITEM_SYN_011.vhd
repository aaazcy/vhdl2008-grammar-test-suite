-- =============================================================
-- Case ID: TC_ENTITY_DECLARATIVE_ITEM_SYN_011
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATIVE_ITEM
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declarative_item ::= subprogram_declaration | subprogram_body | ... (22 alternatives)
-- Case Type: Positive
-- Test Focus: function declaration as entity_declarative_item — the entity declarative part declares the pure function f_clamp(x,lo,hi:integer) return integer, verifying subprogram_declaration is legal in the entity declarative part, the function is visible in the entity and architecture scopes
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity edi_subprog_ent is
  port(raw:in integer; clamped:out integer);
  function f_clamp(x,lo,hi:integer) return integer is
  begin
    if x<lo then return lo;
    elsif x>hi then return hi;
    else return x;
    end if;
  end function f_clamp;
end entity edi_subprog_ent;
architecture bh of edi_subprog_ent is
  constant C_LO:integer:=0;
  constant C_HI:integer:=255;
begin
  clamped<=f_clamp(raw,C_LO,C_HI);
end architecture bh;
