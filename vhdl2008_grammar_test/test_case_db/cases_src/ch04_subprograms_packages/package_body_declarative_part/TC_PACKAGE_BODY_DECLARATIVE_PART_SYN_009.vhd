-- =============================================================
-- Case ID: TC_PACKAGE_BODY_DECLARATIVE_PART_SYN_009
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_BODY_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.7
-- Production: package_body_declarative_part ::= { package_body_declarative_item }
-- Case Type: Positive
-- Test Focus: package_body_declarative_part with alias + use_clause as body items: verification that alias_declaration and use_clause are legal body declarative items
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_au_body is
  type t_nibble is array(3 downto 0) of bit;
  alias a is bit_vector;
end package pkg_au_body;
package body pkg_au_body is
  alias nib is t_nibble;
end package body pkg_au_body;
entity pbdp_au_ent is port(r:out integer); end entity;
architecture bh of pbdp_au_ent is begin r<=0; end architecture bh;
