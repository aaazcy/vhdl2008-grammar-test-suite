-- =============================================================
-- Case ID: TC_PROTECTED_TYPE_DECLARATIVE_PART_SYN_003
-- Rule Type: Syntax
-- Standard Reference: IEEE 1076-2008 Section 5.4.2
-- Production: protected_type_declarative_part ::=
--   { protected_type_declarative_item }
-- Test Focus: Multiple subprogram declarations with
--   attribute_specification items interleaved. Tests
--   repetition with a mix of item types in the declarative
--   part.
-- Case Type: Positive
-- Expected Result: Compiles successfully
-- =============================================================
entity pt_decl_dp_multi is
  port (
    clk   : in  bit;
    avail : out integer
  );
end entity pt_decl_dp_multi;

architecture rtl of pt_decl_dp_multi is
  attribute resource : string;
  type t_pool is protected
    procedure acquire;
    procedure free;
    impure function available return integer;
    attribute resource of acquire : procedure is "pool_entry";
  end protected;
  type t_pool is protected body
    variable v_avail : integer := 4;
    procedure acquire is begin if v_avail > 0 then v_avail := v_avail - 1; end if; end procedure;
    procedure free is begin v_avail := v_avail + 1; end procedure;
    impure function available return integer is begin return v_avail; end function;
  end protected body;
  shared variable sv : t_pool;
begin
  process(clk)
  begin
    if clk'event and clk = '1' then
      sv.acquire;
      avail <= sv.available;
    end if;
  end process;
end architecture rtl;
