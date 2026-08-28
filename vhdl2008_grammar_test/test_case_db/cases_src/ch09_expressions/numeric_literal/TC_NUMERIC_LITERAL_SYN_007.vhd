-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SYN_007
-- Rule Type: Syntax
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Test Focus: physical literal physical_literal with a multi-unit chain: resistance unit chains such as 1 ohm, 1 kohm, 1 Mohm used in constraint checks
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_physical_ohm is
  port (
    r_sel : in  integer range 0 to 3;
    r_val : out integer
  );
end entity num_lit_physical_ohm;

architecture resistance of num_lit_physical_ohm is
  type t_resistance is range 0 to 1000000000
    units
      milliohm;
      ohm  = 1000 milliohm;
      kohm = 1000 ohm;
      Mohm = 1000 kohm;
    end units t_resistance;

  constant R1 : t_resistance := 220 ohm;   -- physical_literal with ohm
  constant R2 : t_resistance := 1 kohm;    -- physical_literal with kohm
  constant R3 : t_resistance := 1 Mohm;    -- physical_literal with Mohm
  constant R4 : t_resistance := 4700 milliohm; -- physical_literal with milliohm
begin
  with r_sel select
    r_val <= t_resistance'pos(R1) when 0,
             t_resistance'pos(R2) when 1,
             t_resistance'pos(R3) when 2,
             t_resistance'pos(R4) when 3;
end architecture resistance;
