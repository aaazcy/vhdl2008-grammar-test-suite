-- =============================================================
-- Case ID: TC_PHYSICAL_LITERAL_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_PHYSICAL_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 5.2.1
-- Production: physical_literal ::= [ abstract_literal ] unit_name
-- Case Type: Positive (Production-Specific)
-- Test Focus: Production-specific: physical literals using based integer decimal literal, exponent-based abstract literal, and bare unit all in one design — exercises all variants of the optional abstract_literal with unit_name
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity phys_lit_all_forms is
  port(
    d1  : out time;
    d2  : out time;
    d3  : out time
  );
end entity;

architecture comprehensive_forms of phys_lit_all_forms is
  type t_resistance is range 0 to 1000000000 units
    uOhm;
    mOhm = 1000 uOhm;
    Ohm  = 1000 mOhm;
    kOhm = 1000 Ohm;
  end units;
  constant C_INT    : time := 5 ns;          -- integer abstract_literal
  constant C_REAL   : time := 3.3 ns;        -- real abstract_literal
  constant C_EXP    : time := 1E6 fs;        -- exponent abstract_literal
  constant C_OCT    : time := 2#1010# ns;    -- based integer literal
  signal r1 : t_resistance := 220 Ohm;
  signal r2 : t_resistance := 4.7 kOhm;
begin
  d1 <= C_INT + C_REAL;
  d2 <= C_EXP;
  d3 <= C_OCT;
end architecture;
