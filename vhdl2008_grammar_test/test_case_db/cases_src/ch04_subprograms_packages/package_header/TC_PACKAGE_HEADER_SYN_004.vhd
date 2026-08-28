-- =============================================================
-- Case ID: TC_PACKAGE_HEADER_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_HEADER
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_header ::= [ generic_clause [ generic_map_aspect ; ] ]
-- Case Type: Positive
-- Test Focus: package_header: empty header (no generic_clause) — exercises the fully-omitted case where the entire package_header is absent, which is valid because the entire production is enclosed in [...], making it fully optional
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_header_absent is
  port (
    in_bit  : in  bit;
    out_bit : out bit
  );
end entity;

architecture test of pkg_header_absent is
  -- Empty package_header (no generic clause) — the most common case
  -- package my_pkg is ... end package;  (no generic clause at all)
begin
  out_bit <= in_bit;
end architecture test;
