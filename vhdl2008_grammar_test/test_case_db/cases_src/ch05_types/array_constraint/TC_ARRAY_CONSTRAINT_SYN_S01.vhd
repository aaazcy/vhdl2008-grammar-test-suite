-- =============================================================
-- Case ID: TC_ARRAY_CONSTRAINT_SYN_S01
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARRAY_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: array_constraint ::= index_constraint [ array_element_constraint ] | ( open ) [ array_element_constraint ]
-- Case Type: Positive (Production-Specific)
-- Test Focus: Constrained array subtype using both index_constraint and array_element_constraint together on a 2D unconstrained array type — tests the full production path index_constraint + array_element_constraint
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity array_ctr_full_prod is
  port(
    trigger   : in  bit;
    match_out : out bit
  );
end entity;

architecture full_production_test of array_ctr_full_prod is
  type t_wide_arr is array (natural range <>, natural range <>) of bit_vector;
  type t_narrow_arr is array (natural range <>) of bit_vector(7 downto 0);
  subtype t_constrained_wide is t_wide_arr(0 to 3, 0 to 7)(7 downto 0); -- index + element constraint
  signal wide_store : t_constrained_wide := (others => (others => (others => '0')));
  signal pattern    : t_narrow_arr(0 to 15) := (others => x"00");
begin
  process(trigger)
  begin
    for r in 0 to 3 loop
      for c in 0 to 7 loop
        wide_store(r,c) <= pattern(r*2 + c/4);
      end loop;
    end loop;
  end process;
  match_out <= trigger;
end architecture;
