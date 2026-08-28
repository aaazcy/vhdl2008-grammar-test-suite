-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_004
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Range constraint with computed constant expressions
--   in the range. Demonstrates that the simple_expressions inside
--   the range can be named constants.
-- Expected Result: Compiles; range based on constants
-- Dependencies: None
-- =============================================================
entity range_constraint_consts is
  port (
    addr  : in  integer;
    valid : out bit
  );
end entity range_constraint_consts;

architecture const_bounds of range_constraint_consts is
  type t_addr_space is range 0 to 65535;
  constant ADDR_LO : t_addr_space := 0;
  constant ADDR_HI : t_addr_space := 1023;
  subtype t_valid_addr is t_addr_space range ADDR_LO to ADDR_HI;
  signal s_addr : t_addr_space;
begin
  s_addr <= t_addr_space(addr);
  valid <= '1' when s_addr >= ADDR_LO and s_addr <= ADDR_HI else '0';
end architecture const_bounds;
