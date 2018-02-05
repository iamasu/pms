package com.sitec.cpse.config;

import org.apache.tiles.AttributeContext;
import org.apache.tiles.context.TilesRequestContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.springframework.stereotype.Service;

/**
 *
 * @author asu
 */
@Service()
public class TilesViewPreparer implements ViewPreparer {

  
    @Override
    public void execute(TilesRequestContext reqContext, AttributeContext attContext) throws PreparerException {
        
    }
}
