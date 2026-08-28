-- =============================================================
-- Case ID: TC_ENTITY_HEADER_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: BNF_ENTITY_HEADER
-- Standard Reference: IEEE 1076-2008 Section 3.2.1
-- Production: entity_header ::= [ formal_generic_clause ] [ formal_port_clause ]
-- Case Type: Negative
-- Test Focus: SMN: generic clause declares a type interface with an unconstrained array but no index constraint resolution—`generic(type vec_t is array(integer range <>) of bit); port(v:in vec_t)` uses an unconstrained array generic type for a port in `in` mode; in VHDL 2008, port `in` mode signals of an unconstrained generic array type require the actual to provide the index constraint at elaboration, but the semantic analyzer must verify that the entity_header itself is syntactically well-formed with an unconstrained generic type used in a port declaration, which is legal in VHDL 2008 and serves as a boundary case that exercises the full generic type interface capability within entity_header
-- Expected Result: Compiles successfully (valid VHDL 2008 boundary case)
-- Dependencies: None
-- =============================================================
entity eh_unconstrained_gen_type is
  generic(
    type vec_t is array(integer range <>) of bit
  );
  port(
    v : in vec_t
  );
end entity eh_unconstrained_gen_type;
