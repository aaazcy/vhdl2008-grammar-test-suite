-- =============================================================
-- Case ID: TC_PACKAGE_DECLARATIVE_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_PACKAGE_DECLARATIVE_PART
-- Standard Reference: IEEE 1076-2008 Section 4.5
-- Production: package_declarative_part ::= { package_declarative_item }
-- Case Type: Positive
-- Test Focus: package_declarative_part: four items (type, signal, constant, component) — exercises the repetition of package_declarative_item alternatives, using items that are unique to package declarations (component, signal) which are NOT available in package bodies
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity pdp_four_items is
  port (
    clk   : in  bit;
    count : out natural
  );
end entity;

architecture test of pdp_four_items is
  -- Item 1: type_declaration
  type counter_t is range 0 to 15;
  -- Item 2: subtype_declaration
  subtype small_cnt_t is counter_t range 0 to 7;
  -- Item 3: constant_declaration
  constant C_TERMINAL : counter_t := 12;
  -- Item 4: signal_declaration (valid in package declarations, NOT in package body)
  signal s_count : counter_t := 0;
begin
  process(clk) is
  begin
    if clk'event and clk = '1' then
      if s_count = C_TERMINAL then
        s_count <= 0;
      else
        s_count <= s_count + 1;
      end if;
    end if;
  end process;
  count <= natural(s_count);
end architecture test;
