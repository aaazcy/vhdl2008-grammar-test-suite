-- =============================================================
-- Case ID: TC_PACKAGE_BODY_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body ::= package body package_simple_name is package_body_declarative_part end [ package body ] [ package_simple_name ] ;
-- Case Type: Positive
-- Test Focus: package_body: type and subtype declarations in declarative part — exercises how the package body's declarative region holds user-defined types that the body implementation depends on
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pkg_body_types is
  port (
    match_out : out boolean;
    val_out   : out natural
  );
end entity pkg_body_types;

architecture test of pkg_body_types is
  -- Simulates a package body declarative part with rich type definitions
  type addr_range_t is range 0 to 65535;
  subtype word_addr_t is addr_range_t range 0 to 65535;
  subtype byte_addr_t is addr_range_t range 0 to 65535;
  constant C_BASE_ADDR : addr_range_t := 4096;

  function f_addr_match(a, b : addr_range_t) return boolean is
  begin
    return a = b;
  end function;

  signal s_addr : addr_range_t := C_BASE_ADDR;
begin
  match_out <= f_addr_match(s_addr, C_BASE_ADDR);
  val_out   <= natural(s_addr);
end architecture test;
