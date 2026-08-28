-- =============================================================
-- Case ID: TC_SELECTED_NAME_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SELECTED_NAME_001
-- Standard Reference: IEEE 1076-2008 Section 8.5
-- Production: selected_name ::= prefix . suffix
-- Case Type: Positive
-- Rule Description: In a selected_name the suffix must be a member actually declared in the entity referenced by the prefix (record element, object in a package, signal in a block, etc.)
-- Test Focus: Semantic positive case——in s_rec.x, x is an actually declared field of the t_rec record type; the suffix legally references a member inside the prefix, and both syntax and semantics are correct
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity sel_name_valid_sem is
  port(din : in integer; dout : out integer);
end entity;

architecture vhdl2008 of sel_name_valid_sem is
  type t_rec is record a : integer; b : integer; end record;
  signal s_rec : t_rec := (a => 0, b => 0);
begin
  process(din)
  begin
    s_rec.a <= din;
    dout <= s_rec.a;
  end process;
end architecture vhdl2008;
