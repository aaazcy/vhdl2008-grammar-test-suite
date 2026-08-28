-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SEM: generic identifier and port identifier collide within entity_header—`generic(DATA:integer:=8); port(DATA:in bit_vector(7 downto 0))` declares the same name `DATA` as both a generic constant and a port signal; although both declarations are syntactically correct per their respective BNF sub-productions, the entity header forms a single declarative region and VHDL prohibits name collisions between generics and ports within the same entity
-- Expected Result: Triggers semantic error: DATA declared as both generic and port
-- Dependencies: None
-- =============================================================
entity eh_generic_port_clash is
  generic(
    DATA : integer := 8
  );
  port(
    DATA : in bit_vector(7 downto 0)
  );
end entity eh_generic_port_clash;
