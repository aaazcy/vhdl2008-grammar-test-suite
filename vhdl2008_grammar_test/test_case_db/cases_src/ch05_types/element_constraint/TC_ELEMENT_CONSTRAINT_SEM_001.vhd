-- =============================================================
-- Case ID: TC_ELEMENT_CONSTRAINT_SEM_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_ELEMENT_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: element_constraint ::= array_constraint
--              | record_constraint
-- Case Type: Positive
-- Test Focus: Semantic: element_constraint with array_constraint
--            defining a constrained element type for a wavelet
--            transform coefficient matrix. Each coefficient is
--            bounded between -512 and 511.
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity wavelet_coeff_matrix is
  port (
    row    : in  integer range 0 to 7;
    col    : in  integer range 0 to 7;
    coeff  : in  integer range -512 to 511;
    stored : out integer range -512 to 511
  );
end entity wavelet_coeff_matrix;

architecture rtl of wavelet_coeff_matrix is
  -- element_constraint: array_constraint on integer range
  subtype wav_coeff is integer range -512 to 511;
  type coeff_matrix is array (0 to 7, 0 to 7) of wav_coeff;
  signal mat : coeff_matrix := (others => (others => 0));
  signal wr_en : bit := '1';
begin
  process
  begin
    if wr_en = '1' then
      mat(row, col) <= coeff;
    end if;
    stored <= mat(row, col);
    wait for 1 ns;
  end process;
end architecture rtl;
