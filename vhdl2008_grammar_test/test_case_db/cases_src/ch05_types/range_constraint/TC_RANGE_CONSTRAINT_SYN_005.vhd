-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SYN_005
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Multiple range constraints on the same base type
--   producing non-overlapping subtypes. Each subtype uses a distinct
--   range_constraint. Exercises that range_constraint parses
--   correctly in multiple subtype declarations.
-- Expected Result: Compiles; three independent constrained subtypes
-- Dependencies: None
-- =============================================================
entity range_constraint_partitions is
  port (
    idx    : in  integer;
    seg    : out integer;
    value  : out integer
  );
end entity range_constraint_partitions;

architecture multi_constraint of range_constraint_partitions is
  type t_full is range 0 to 255;
  subtype t_low  is t_full range 0   to 85;
  subtype t_mid  is t_full range 86  to 170;
  subtype t_high is t_full range 171 to 255;
  signal s_low  : t_low  := 0;
  signal s_mid  : t_mid  := 86;
  signal s_high : t_high := 171;
begin
  process(idx)
  begin
    if idx <= 85 then
      s_low  <= t_low(idx);
    elsif idx <= 170 then
      s_mid  <= t_mid(idx);
    else
      s_high <= t_high(idx);
    end if;
  end process;
  seg   <= 0 when idx <= 85 else 1 when idx <= 170 else 2;
  value <= integer(s_low) when idx <= 85 else
           integer(s_mid) when idx <= 170 else
           integer(s_high);
end architecture multi_constraint;
