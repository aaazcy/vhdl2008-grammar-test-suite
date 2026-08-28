-- =============================================================
-- Case ID: TC_NUMERIC_LITERAL_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_NUMERIC_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: numeric_literal ::= abstract_literal | physical_literal
-- Case Type: Positive
-- Rule Description: The unit of a physical_literal must be a primary_unit or secondary_unit declared in the corresponding physical type definition; the value of an abstract_literal must be within the legal range of the target type
-- Test Focus: physical_literal unit matches the physical type definition: physical_literals such as 100 nF, 10 pF used in the user-defined t_capacity type (units F/nF/pF), verifying that the units are legal in the type's units list and derivable
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity num_lit_sem_001 is
  port (
    cap_sel : in  integer range 0 to 3;
    cap_pos : out integer
  );
end entity num_lit_sem_001;

architecture valid_phys_units of num_lit_sem_001 is
  type t_capacity is range 0 to 1000000000
    units
      fF;
      pF = 1000 fF;
      nF = 1000 pF;
      uF = 1000 nF;
    end units t_capacity;

  constant C1 : t_capacity := 100 nF;   -- valid physical_literal with nF
  constant C2 : t_capacity := 10 pF;    -- valid physical_literal with pF
  constant C3 : t_capacity := 1 uF;     -- valid physical_literal with uF
  constant C4 : t_capacity := 4700 fF;  -- valid physical_literal with fF
begin
  with cap_sel select
    cap_pos <= t_capacity'pos(C1) when 0,
               t_capacity'pos(C2) when 1,
               t_capacity'pos(C3) when 2,
               t_capacity'pos(C4) when 3;
end architecture valid_phys_units;
