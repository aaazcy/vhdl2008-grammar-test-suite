-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_ASSOCIATION
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Positive
-- Rule Description: The index choice in a named association must lie within the legal range of the target array; the record field name must exactly match the record type declaration
-- Test Focus: Array named associations with indices in the legal range and record field names matching the declaration: 0=>10 (index within 0..3), field => val (field exists in the record), verifying the legal use
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ea_sem_001 is
  port (
    x : out integer
  );
end entity ea_sem_001;

architecture valid_named of ea_sem_001 is
  type t_arr is array(0 to 3) of integer;
  type t_rec is record
    lo, hi : integer;
  end record t_rec;

  signal s_arr : t_arr;
  signal s_rec : t_rec;
begin
  s_arr <= (0 => 10, 1 => 20, 2 => 30, 3 => 40);  -- all indices in range
  s_rec <= (lo => s_arr(0), hi => s_arr(3));       -- field names match record
  x <= s_rec.lo + s_rec.hi;
end architecture valid_named;
