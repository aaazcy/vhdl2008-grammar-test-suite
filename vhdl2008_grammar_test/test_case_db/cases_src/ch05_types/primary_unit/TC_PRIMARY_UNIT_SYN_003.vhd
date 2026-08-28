-- =============================================================
-- Case ID: TC_PRIMARY_UNIT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_PRIMARY_UNIT
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: (Physical type) primary_unit ::= the base measurement unit name — the identifier before the semicolon in primary_unit_declaration
-- Case Type: Positive
-- Test Focus: Primary unit with very short name (single letter), normal name, and long descriptive name — tests identifier flexibility for primary unit names
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity prim_unit_name_styles is
  port(idx : out integer);
end entity;

architecture naming_styles of prim_unit_name_styles is
  type t_short is range 0 to 1000 units m; cm=100 m; end units;
  type t_normal is range 0 to 1000 units volt; mV=1000 volt; end units;
  type t_long is range 0 to 1000000 units micro_ampere; milli_ampere=1000 micro_ampere; end units;
  signal a : t_short := 5 m;
  signal b : t_normal := 220 volt;
  signal c : t_long := 500 micro_ampere;
begin
  idx <= integer(a/m) + integer(b/volt) + integer(c/micro_ampere);
end architecture;
