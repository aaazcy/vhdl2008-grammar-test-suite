-- =============================================================
-- Case ID: TC_ENTITY_DECLARATION_SYN_010
-- Rule Type: Syntax
-- Related Rule ID: BNF_ENTITY_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_declaration ::= entity identifier is entity_header entity_declarative_part [ begin entity_statement_part ] end [ entity ] [ entity_simple_name ] ;
-- Case Type: Positive
-- Test Focus: VHDL 2008 generic type interface: entity header contains `generic(type T)` — type used as generic parameter, ports use this generic type as the signal type, verifying the IEEE 1076-2008 new feature generic type is legal in entity_declaration
-- Expected Result: Compiles successfully (VHDL 2008)
-- Dependencies: None
-- =============================================================
entity ent_gen_type is
  generic(
    type T;
    function "<"(L, R : T) return boolean is <>;
    constant C_DEFAULT : T
  );
  port(
    din  : in  T;
    dout : out T
  );
end entity ent_gen_type;
architecture bh of ent_gen_type is
begin
  dout <= din;
end architecture bh;
