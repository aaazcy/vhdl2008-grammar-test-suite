-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header with generic_clause multiple generics(integer+boolean+positive) with default values: generic(WIDTH:integer:=8; PIPELINED:boolean:=true; STAGES:positive:=3), verification of generic_clause diversity
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_multi_gen is
  generic(
    WIDTH:integer:=8;
    PIPELINED:boolean:=true;
    STAGES:positive:=3
  );
  constant C_BITS:integer:=WIDTH;
  constant C_PIPE_STAGES:positive:=STAGES;
end package pkg_multi_gen;
package my_pkg_multi_gen is new work.pkg_multi_gen generic map(WIDTH => 8, PIPELINED => true, STAGES => 3);
entity ph_mgen_ent is port(bits:out integer; stages:out positive); end entity;
architecture bh of ph_mgen_ent is begin bits<=work.my_pkg_multi_gen.C_BITS; stages<=work.my_pkg_multi_gen.C_PIPE_STAGES; end architecture bh;
